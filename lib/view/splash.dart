import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoflow/extentions/extentions.dart';
import 'package:infoflow/view/homepage.dart';

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
    Future.delayed(const Duration(milliseconds: 2500), () {
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
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 1600),
        builder: (context, value, child) {
          return Center(
            child: AnimatedOpacity(
              duration:const Duration(milliseconds: 1000) ,
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "INFO ",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(fontSize: 30.spMin),
                      ),
                      TextSpan(
                        text: "Flow",
                        style: context.textTheme.bodyLarge?.copyWith(
                            color: ColorManager.yellow, fontSize: 30.spMin),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
