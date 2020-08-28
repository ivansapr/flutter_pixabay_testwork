import 'package:flutter/material.dart';

import '../models/image.dart';
import '../page/image_page.dart';

class ImageScreenArguments {
  ImageScreenArguments(this.image);

  final ImageModel image;
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key key, this.args}) : super(key: key);

  static const routeName = '/image';

  final ImageScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      image: args.image,
    );
  }
}
