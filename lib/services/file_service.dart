import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../services/file_service_interface.dart';

class FileService implements FileServiceInterface {
  final dio = Dio();

  @override
  Future<bool> save(Uint8List imageBytes, String name) =>
      ImageGallerySaver.saveImage(imageBytes, name: name);

  @override
  Future<Response> download(String url) =>
      dio.get(url, options: Options(responseType: ResponseType.bytes));
}
