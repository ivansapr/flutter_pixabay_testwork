import 'package:flutter/material.dart';

import '../models/image.dart';

class ImageListTileWidget extends StatelessWidget {
  const ImageListTileWidget({Key key, this.image, this.onTap})
      : super(key: key);

  final ImageModel image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image.id,
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(5),
        child: InkWell(
          onTap: onTap,
          child: Image.network(
            image.webformatURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
