import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectx/model/news_model.dart';
import 'package:projectx/widgets/news_card.dart';

import '../provider/news_provider.dart';

class NewsListView extends ConsumerWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsListAsync = ref.watch(newsProvider);

    return newsListAsync.when(
      data: (newsList) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            NewsModel article = newsList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NewsCard(
                news: article,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
