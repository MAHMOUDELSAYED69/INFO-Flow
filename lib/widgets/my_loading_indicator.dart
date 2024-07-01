import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoflow/constant/colors.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 40.w,
          width: 40.w,
          child: CircularProgressIndicator(
                color: ColorManager.yellow,
                strokeCap: StrokeCap.round,
                strokeWidth: 5,
              ),
        ));
  }
}
