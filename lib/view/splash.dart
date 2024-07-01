import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/extentions/extentions.dart';
import 'package:projectx/view/homepage.dart';

import '../constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  goToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  "INFO ",
                  textStyle:
                      context.textTheme.bodyLarge?.copyWith(fontSize: 30.spMin),
                ),
              ],
            ),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  "Flow",
                  textStyle: context.textTheme.bodyLarge?.copyWith(
                      color: ColorManager.yellow, fontSize: 30.spMin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
