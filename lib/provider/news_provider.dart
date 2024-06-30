import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectx/model/news_model.dart';

import '../services/news_service.dart';

final newsProvider = FutureProvider.autoDispose<List<NewsModel>>((ref) async {
  try {
    return await NewsWebService.getNews(category: 'general');
  } catch (e) {
    return [];
  }
});
