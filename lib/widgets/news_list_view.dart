import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infoflow/constant/colors.dart';
import 'package:infoflow/extentions/extentions.dart';
import 'package:infoflow/router/app_router.dart';
import 'package:infoflow/widgets/news_card.dart';

import '../provider/news_provider.dart';
import 'my_divider.dart';
import 'my_loading_indicator.dart';

class NewsListView extends ConsumerWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsListAsync = ref.watch(newsProvider('general'));

    return newsListAsync.when(
      data: (newsList) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index.isEven) {
                final article = newsList[(index ~/ 2)];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, RouteManager.postDetails,
                      arguments: article),
                  child: NewsCard(news: article),
                );
              } else {
                return const MyDivider();
              }
            },
            childCount: newsList.length * 2 - 1,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(
          heightFactor: 12,
          child: MyLoadingIndicator(),
        ),
      ),
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Error: $error',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: ColorManager.yellow),
          ),
        ),
      ),
    );
  }
}
