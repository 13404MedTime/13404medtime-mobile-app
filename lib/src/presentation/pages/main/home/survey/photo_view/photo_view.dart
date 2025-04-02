import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../../core/extension/extension.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
            backgroundDecoration: BoxDecoration(
              color: context.colorScheme.background,
            ),
          ),
        ),
      );
}
