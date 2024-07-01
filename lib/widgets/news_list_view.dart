import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/constant/colors.dart';
import 'package:projectx/extentions/extentions.dart';
import 'package:projectx/view/post_details_screen.dart';
import 'package:projectx/widgets/news_card.dart';

import '../provider/news_provider.dart';
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsScreen(news: article),
                      ),
                    );
                  },
                  child: NewsCard(news: article),
                );
              } else {
                return Divider(
                  color: ColorManager.yellow,
                  height: 20.h,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                );
              }
            },
            childCount: newsList.length * 2 - 1,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: MyLoadingIndicator()),
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
