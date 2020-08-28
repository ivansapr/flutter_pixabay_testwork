import '../models/api/pagination.dart';
import '../models/colors.dart';
import '../models/image.dart';
import '../services/images_service_interface.dart';

abstract class ImagesRepositoryInterface {
  ImagesRepositoryInterface(this.imageService);

  final ImagesServiceInteface imageService;

  Future<PaginationModel> search({AcceptedColor color, int page});

  Future<bool> saveImage(ImageModel image);
}
