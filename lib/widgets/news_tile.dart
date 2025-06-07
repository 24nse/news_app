import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/custom_text.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            articleModel.image??"assets\technology.jpeg",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          
        ),
        const SizedBox(height: 12,),
        CustomText(
         text:  articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 8,),
        CustomText(
         text:  articleModel.subTitle??"assets\technology.jpeg",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}