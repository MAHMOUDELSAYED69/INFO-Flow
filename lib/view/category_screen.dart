import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/news_provider.dart';

class CategoryScreen extends ConsumerWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsListAsync = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: newsListAsync.when(
        data: (newsList) {
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return ListTile(
                title: Text(news.title.toString()),
                subtitle: Text(news.description.toString()),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Error fetching data')),
      ),
    );
  }
}
