import 'package:flutter_test_work/models/api/pagination.dart';
import 'package:flutter_test_work/models/colors.dart';
import 'package:flutter_test_work/models/image.dart';

import '../models/api/pagination.dart';
import '../services/images_service_interface.dart';

abstract class ImagesRepositoryInterface {
  ImagesRepositoryInterface(this.imageService);

  final ImagesServiceInteface imageService;

  Future<PaginationModel> search({AcceptedColor color, int page});

  Future<bool> saveImage(ImageModel image);
}
