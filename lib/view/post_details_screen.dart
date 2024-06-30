import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectx/model/news_model.dart';
import 'package:projectx/provider/lunch_uri_provider.dart';

class PostDetailsScreen extends ConsumerWidget {
  final NewsModel news;

  const PostDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    news.urlToImage ??
                        "https://about.fb.com/wp-content/uploads/2023/09/GettyImages-686732223.jpg",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 10),
              if (news.title != null)
                SelectableText(
                  news.title!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 14),
              if (news.content != null)
                SelectableText(
                  news.content!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 14),
              if (news.description != null)
                SelectableText(
                  news.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 14),
              if (news.author != null)
                SelectableText(
                  "Author: ${news.author}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 14),
              if (news.url != null)
                GestureDetector(
                  onTap: () {
                    ref
                        .read(urlLauncherProvider)
                        .launchURL(Uri.encodeFull(news.url!));
                    log("uri");
                  },
                  child: Text(
                    news.url!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
