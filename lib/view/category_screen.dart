import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infoflow/router/app_router.dart';
import 'package:infoflow/widgets/my_divider.dart';
import 'package:infoflow/widgets/news_image.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:infoflow/constant/colors.dart';
import 'package:infoflow/extentions/extentions.dart';
import '../provider/news_provider.dart';
import '../widgets/my_loading_indicator.dart';

class CategoryScreen extends ConsumerWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsListAsync = ref.watch(newsProvider(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: LiquidPullToRefresh(
        color: ColorManager.yellow,
        onRefresh: () async => ref.refresh(newsProvider(category)),
        animSpeedFactor: 2,
        child: newsListAsync.when(
          data: (newsList) {
            return ListView.separated(
              separatorBuilder: (context, index) => const MyDivider(),
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  onTap: () => Navigator.pushNamed(
                      context, RouteManager.postDetails,
                      arguments: news),
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NewsImage(imageUrl: news.urlToImage),
                      const SizedBox(height: 10),
                      if (news.title != null)
                        Text(
                          news.title.toString(),
                          style: context.textTheme.bodyLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  subtitle: news.description != null
                      ? Text(
                          news.description.toString(),
                          style: context.textTheme.displayMedium,
                          maxLines: 2,
                        )
                      : null,
                );
              },
            );
          },
          loading: () => const MyLoadingIndicator(),
          error: (error, stackTrace) =>
              const Center(child: Text('Error fetching data')),
        ),
      ),
    );
  }
}
