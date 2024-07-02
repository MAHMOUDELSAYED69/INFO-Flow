
import 'package:flutter/material.dart';

import '../constant/images.dart';
import 'my_loading_indicator.dart';

class NewsImage extends StatelessWidget {
  final String? imageUrl;

  const NewsImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl ?? ImageManager.defaultNetworkImage,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: MyLoadingIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
