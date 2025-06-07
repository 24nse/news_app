import 'package:flutter/material.dart';
import 'package:news_app/helper/image_loader.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/custom_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, 
    required this.category,
    this.onTap,
  });
  
  final CategoryModel category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 85,
          width: 160,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ImageLoader(
                    imagePath: category.image,
                    width: 160,
                    height: 85,
                    fit: BoxFit.fill,
                    isNetworkImage: false,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CustomText(text: category.categoryName,style:  const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

