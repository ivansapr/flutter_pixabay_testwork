import 'package:dio/dio.dart';

import '../services/images_service_interface.dart';

class PixabayService implements ImagesServiceInteface {
  String _apiUrl = 'https://pixabay.com/api/';

  final String key;

  final Dio dio = Dio();

  PixabayService(this.key);

  @override
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
  }) async {
    final params = {
      'key': key,
      'q': q,
      'lang': lang,
      'id': id,
      'image_type': imageType,
      'orientation': orientation,
      'category': category,
      'min_width': minWidth,
      'min_height': minHeight,
      'colors': colors?.join('+'),
      'editors_choice': editorsChoice,
      'safesearch': safeSearch,
      'order': order,
      'page': page,
      'per_page': perPage,
      'callback': jsonCallback,
    };

    params.removeWhere((key, value) => value == null);
    return dio.get(
      _apiUrl,
      queryParameters: params,
    );
  }
}
