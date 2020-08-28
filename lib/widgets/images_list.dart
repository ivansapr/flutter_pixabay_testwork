import 'package:flutter/material.dart';
import 'package:flutter_test_work/models/image.dart';

import 'image_list_tile.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({
    Key key,
    this.images,
    this.onTap,
    this.controller,
  }) : super(key: key);

  final List<ImageModel> images;
  final Function(ImageModel image) onTap;
  final ScrollController controller;

  Widget _listTileBuilder(BuildContext context, int index) {
    return ImageListTileWidget(
      image: images[index],
      onTap: () => onTap(images[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            _listTileBuilder,
            childCount: images.length,
          ),
        ),
      ],
    );
  }
}
