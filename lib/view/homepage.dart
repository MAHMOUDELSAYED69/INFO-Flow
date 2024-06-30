import 'package:flutter/material.dart';
import '../widgets/category_list_view.dart';
import '../widgets/news_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Info",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Flow",
              style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CategoryListView(),
          const SizedBox(height: 20),
          const Expanded(child: NewsListView())
        ],
      ),
    );
  }
}
