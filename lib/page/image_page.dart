import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/models/image.dart';
import 'package:flutter_test_work/repositories/images_repository_interface.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({
    Key key,
    @required this.image,
  }) : super(key: key);

  final ImageModel image;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  ImagesRepositoryInterface repository;

  @override
  void initState() {
    super.initState();

    repository = RepositoryProvider.of<ImagesRepositoryInterface>(context);
  }

  void _imageDonwload(BuildContext context) async {
    final result = await repository.saveImage(widget.image);
    final text = result ? 'Успешно' : 'Неудача';
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.image.webformatURL),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: widget.image.id,
                child: Image.network(widget.image.webformatURL),
              ),
              IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: () => _imageDonwload(context))
            ],
          ),
        ),
      ),
    );
  }
}
