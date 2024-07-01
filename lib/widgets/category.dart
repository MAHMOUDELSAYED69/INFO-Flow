import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/model/category_model.dart';

import '../constant/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 100.h,
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(category.image)),
        ),
        child: Center(
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 24, color: ColorManager.white),
          ),
        ),
      ),
    );
  }
}
