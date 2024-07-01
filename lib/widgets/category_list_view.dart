import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/view/category_screen.dart';
import 'package:projectx/widgets/category.dart';

import '../model/category_model.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final List<CategoryModel> categories = [
    CategoryModel(
      image: 'assets/images/sports.avif',
      title: 'Sports',
    ),
    CategoryModel(
      image: 'assets/images/business.avif',
      title: 'Business',
    ),
    CategoryModel(
      image: 'assets/images/technology.jpeg',
      title: 'Technology',
    ),
    CategoryModel(
      image: 'assets/images/entertaiment.avif',
      title: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/images/health.avif',
      title: 'Health',
    ),
    CategoryModel(
      image: 'assets/images/science.avif',
      title: 'Science',
    ),
    CategoryModel(
      image: 'assets/images/general.avif',
      title: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    category: categories[index].title,
                  ),
                ));
          },
          child: CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
