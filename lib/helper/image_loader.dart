import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageLoader extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String placeholderPath;
  final bool isNetworkImage;

  const ImageLoader({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderPath = 'assets/business.avif',
    this.isNetworkImage = false,
  });

    ImageProvider get imageProvider {
    if (isNetworkImage) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return isNetworkImage ? _buildNetworkImage() : _buildAssetImage();
  }

  Widget _buildNetworkImage() {
    
    return Image.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  Widget _buildAssetImage() {
    return FutureBuilder<bool>(
      future: _checkIfAssetExists(imagePath),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
          );
        } else {
          return _buildPlaceholder();
        }
      },
    );
  }

  Future<bool> _checkIfAssetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  Widget _buildPlaceholder() {
    return FutureBuilder<bool>(
      future: _checkIfAssetExists(placeholderPath),
      builder: (context, snapshot) {
        final usePlaceholder = snapshot.hasData && snapshot.data == true;
        return Image.asset(
          usePlaceholder ? placeholderPath : 'assets/technology.jpeg',
          width: width,
          height: height,
          fit: fit,
        );
      },
    );
  }

}