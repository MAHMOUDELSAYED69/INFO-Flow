import 'package:dio/dio.dart';
import 'package:infoflow/constant/api_url.dart';

import '../model/news_model.dart';

class NewsWebService
 {
  static final Dio dio = Dio();

  static Future<List<NewsModel>> getNews(
      {required String category}) async {
    try {
      Map<String, dynamic>? queryParameters = {
        "country": "us",
        "apiKey": ApiUrlManager.newsApiKey,
        "category": category
      };
      var response = await dio.get(ApiUrlManager.newsBaseUrl,
          queryParameters: queryParameters);

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<NewsModel> articlesList = [];

      for (var article in articles) {
        NewsModel articleModel = NewsModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
