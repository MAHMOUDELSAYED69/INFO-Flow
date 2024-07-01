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
  final NewsModel news;

  const PostDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Image.network(
                news.urlToImage ?? ImageManager.defaultNetworkImage,
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
                  if (news.title != null)
                    SelectableText(
                      "${news.title} \n",
                      style: context.textTheme.bodyLarge,
                    ),
                  SelectableText(
                    "${news.content ?? ""}\n\n${news.description ?? ""}\n",
                    style: context.textTheme.bodyMedium,
                  ),
                  if (news.author != null)
                    SelectableText(
                      "Author: ${news.author ?? ""}\n",
                      style: context.textTheme.bodyMedium,
                    ),
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
