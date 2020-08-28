import 'package:dio/dio.dart';

abstract class ImagesServiceInteface {
  Future<Response> search({
    String q,
    String lang,
    int id,
    String imageType,
    String orientation,
    String category,
    int minWidth,
    int minHeight,
    List<String> colors,
    bool editorsChoice,
    bool safeSearch,
    String order,
    int page,
    int perPage,
    String jsonCallback,
  });
}
