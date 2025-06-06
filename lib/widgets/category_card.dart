import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context){
        //     return 
        //   })
        // )
      },
    );
  }
}