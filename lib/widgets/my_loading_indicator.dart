
import 'package:flutter/material.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.yellow[700],
      strokeCap: StrokeCap.round,
      strokeWidth: 5,
    ));
  }
}
