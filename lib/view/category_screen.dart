import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectx/constant/colors.dart';
import 'package:projectx/extentions/extentions.dart';
import '../provider/news_provider.dart';
import '../widgets/my_loading_indicator.dart';
import 'post_details_screen.dart';

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
      body: newsListAsync.when(
        data: (newsList) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: ColorManager.yellow,
              height: 10,
              thickness: 2,
              endIndent: 10,
              indent: 10,
            ),
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsScreen(news: news),
                      ));
                },
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          news.urlToImage ??
                              "https://about.fb.com/wp-content/uploads/2023/09/GettyImages-686732223.jpg",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
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
    );
  }
}
