import 'dart:typed_data';

import 'package:dio/dio.dart';

abstract class FileServiceInterface {
  Future<bool> save(Uint8List imageBytes, String name);
  Future<Response> download(String url);
}
