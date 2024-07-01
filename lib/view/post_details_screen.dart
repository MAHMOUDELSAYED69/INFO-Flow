import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/constant/colors.dart';
import 'package:projectx/extentions/extentions.dart';
import 'package:projectx/model/news_model.dart';
import 'package:projectx/provider/lunch_uri_provider.dart';

class PostDetailsScreen extends ConsumerWidget {
  final NewsModel news;

  const PostDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      news.urlToImage ??
                          "https://about.fb.com/wp-content/uploads/2023/09/GettyImages-686732223.jpg",
                      height: 240.h,
                      width: context.width,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 12.h),
              if (news.title != null)
                SelectableText(
                  news.title!,
                  style: context.textTheme.bodyLarge,
                ),
              SizedBox(height: 12.h),
              if (news.content != null)
                SelectableText(
                  news.content!,
                  style: context.textTheme.bodyMedium,
                ),
              SizedBox(height: 12.h),
              if (news.description != null)
                SelectableText(
                  news.description!,
                  style: context.textTheme.bodyMedium,
                ),
              SizedBox(height: 12.h),
              if (news.author != null)
                SelectableText(
                  "Author: ${news.author}",
                  style: context.textTheme.bodySmall,
                ),
              SizedBox(height: 12.h),
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
      ),
    );
  }
}
