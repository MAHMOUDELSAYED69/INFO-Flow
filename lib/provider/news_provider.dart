import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infoflow/model/news_model.dart';

import '../services/news_service.dart';

final newsProvider = FutureProvider.autoDispose
    .family<List<NewsModel>, String>((ref, category) async {
  try {
    return await NewsWebService.getNews(category: category.toLowerCase())
        .whenComplete(() => log("Fetch"));
  } catch (e) {
    return [];
  }
});
