import 'package:flutter/material.dart';
import 'package:projectx/model/news_model.dart';

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
          if (news.urlToImage != null)
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  news.urlToImage.toString(),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
          const SizedBox(height: 10),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            news.title.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            maxLines: 2,
            news.content.toString(),
            style: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
