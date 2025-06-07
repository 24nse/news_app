import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  final Function(String)? onCategorySelected;
  
  const CategoriesListView({
    super.key,
    this.onCategorySelected,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: "assets/business.avif", categoryName: "business"),
    CategoryModel(image: "assets/entertaiment.avif", categoryName: "entertainment"),
    CategoryModel(image: "assets/general.avif", categoryName: "general"),
    CategoryModel(image: "assets/health.avif", categoryName: "health"),
    CategoryModel(image: "assets/science.avif", categoryName: "science"),
    CategoryModel(image: "assets/sports.avif", categoryName: "sports"),
    CategoryModel(image: "assets/technology.jpeg", categoryName: "technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return CategoryCard(
            category: categories[index],
            onTap: () {
              if (onCategorySelected != null) {
                onCategorySelected!(categories[index].categoryName);
              }
            },
          );
        },
      ),
    );
  }
}