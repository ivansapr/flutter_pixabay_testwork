import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageModel {
  ImageModel({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.favorites,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  final int id;
  final String pageUrl;
  final String type;
  final String tags;
  final String previewURL;

  final int previewWidth;
  final int previewHeight;

  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;

  final String largeImageURL;
  final String fullHDURL;

  final String imageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;

  final int views;
  final int downloads;
  final int favorites;
  final int likes;
  final int comments;

  @JsonKey(name: 'user_id')
  final int userId;

  final String user;
  final String userImageURL;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
