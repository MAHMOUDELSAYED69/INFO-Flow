import 'package:flutter/material.dart';
import 'package:projectx/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        height: 125,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(category.image)),
        ),
        child: Center(
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 24,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
