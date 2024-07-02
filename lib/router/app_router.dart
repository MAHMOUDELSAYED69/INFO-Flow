import 'package:flutter/material.dart';
import 'package:infoflow/view/category_screen.dart';
import 'package:infoflow/view/homepage.dart';
import 'package:infoflow/view/post_details_screen.dart';

import '../model/news_model.dart';
import '../view/splash.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return _materialPageRoute(const SplashScreen());
      case RouteManager.home:
        return _materialPageRoute(const HomeScreen());
      case RouteManager.category:
        String category = settings.arguments as String;
        return _materialPageRoute(CategoryScreen(category: category));
      case RouteManager.postDetails:
        NewsModel news = settings.arguments as NewsModel;
        return _materialPageRoute(PostDetailsScreen(article: news));

      default:
        return null;
    }
  }

  static _materialPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}

abstract class RouteManager {
  const RouteManager._();
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String category = '/category';
  static const String postDetails = '/postDetails';
}
