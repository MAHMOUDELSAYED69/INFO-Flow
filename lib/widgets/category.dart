import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoflow/extentions/extentions.dart';
import 'package:infoflow/model/category_model.dart';

import '../constant/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 100.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              category.image,
            )),
      ),
      child: Center(
        child: Text(
          category.title,
          style: context.textTheme.bodyLarge?.copyWith(
            shadows: [
              Shadow(
                blurRadius: 10,
                color: ColorManager.black.withOpacity(0.5),
                offset: const Offset(4, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
