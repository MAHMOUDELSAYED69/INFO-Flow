import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoflow/extentions/extentions.dart';
import 'package:infoflow/model/news_model.dart';

import 'news_image.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewsImage(
            imageUrl: news.urlToImage,
          ),
          SizedBox(height: 8.h),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            news.title.toString(),
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          if (news.content != null)
            Text(
              maxLines: 2,
              news.content.toString(),
              style: context.textTheme.displayMedium,
            ),
        ],
      ),
    );
  }
}
