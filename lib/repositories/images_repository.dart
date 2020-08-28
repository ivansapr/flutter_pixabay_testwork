import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/api/pagination.dart';
import '../models/colors.dart';
import '../models/image.dart';
import '../services/file_service_interface.dart';
import '../services/images_service_interface.dart';
import 'images_repository_interface.dart';

class ImagesRepository implements ImagesRepositoryInterface {
  ImagesRepository({
    @required this.imageService,
    @required this.fileService,
  });

  final ImagesServiceInteface imageService;
  final FileServiceInterface fileService;

  @override
  Future<PaginationModel> search({AcceptedColor color, int page}) async {
    final c = enumColorToString(color);
    final response = await imageService.search(colors: [c], page: page);
    final json = response.data;

    return compute(PaginationModel.fromJson, json);
  }

  String enumColorToString(AcceptedColor color) =>
      color.toString().split('.').last;

  @override
  Future<bool> saveImage(ImageModel image) async {
    if (Platform.isAndroid) {
      await Permission.mediaLibrary.request();
      await Permission.storage.request();
    }
    final response = await fileService.download(image.webformatURL);
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      name: image.id.toString(),
    );
    return result;
  }
}
