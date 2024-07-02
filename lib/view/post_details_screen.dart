import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoflow/constant/colors.dart';
import 'package:infoflow/extentions/extentions.dart';
import 'package:infoflow/model/news_model.dart';
import 'package:infoflow/provider/lunch_uri_provider.dart';

import '../constant/images.dart';

class PostDetailsScreen extends ConsumerWidget {
  final NewsModel article;

  const PostDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Image.network(
                article.urlToImage ?? ImageManager.defaultNetworkImage,
                height: 240.h,
                width: context.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  if (article.title != null)
                    SelectableText(
                      "${article.title} \n",
                      style: context.textTheme.bodyLarge,
                    ),
                  SelectableText(
                    "${article.content ?? ""}\n\n${article.description ?? ""}\n",
                    style: context.textTheme.bodyMedium,
                  ),
                  if (article.author != null)
                    SelectableText(
                      "Author: ${article.author ?? ""}\n",
                      style: context.textTheme.bodyMedium,
                    ),
                  if (article.url != null)
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(urlLauncherProvider)
                            .launchURL(Uri.encodeFull(article.url!));
                        log("uri");
                      },
                      child: Text(
                        article.url!,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: ColorManager.blue),
                      ),
                    ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
