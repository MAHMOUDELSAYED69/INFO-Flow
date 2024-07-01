import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrlManager {
  static String newsBaseUrl = dotenv.env["newsBaseUrl"]!;
  static String newsApiKey = dotenv.env["newsApiKey"]!;
}
