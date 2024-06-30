import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

final urlLauncherProvider = Provider((ref) => NewsUrlLauncher());

class NewsUrlLauncher {
  Future<void> launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
       log('Could not launch $url');
      }
    } catch (e) {
     log('Error launching URL: $e');
    }
  }
}
