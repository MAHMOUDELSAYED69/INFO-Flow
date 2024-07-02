import 'package:flutter/material.dart';
import 'package:infoflow/constant/colors.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({
    super.key,
    this.value,
  });
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 35,
      width: 35,
      child: CircularProgressIndicator(
          color: ColorManager.yellow, strokeCap: StrokeCap.round, value: value),
    ));
  }
}
