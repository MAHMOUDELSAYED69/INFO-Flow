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
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                
                    "https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2016/11/shutterstock_344519003.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 10),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
           " news.title",
            style: const TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            maxLines: 2,
           " news.subTitle",
            style: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
