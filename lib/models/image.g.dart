// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    id: json['id'] as int,
    pageUrl: json['pageUrl'] as String,
    type: json['type'] as String,
    tags: json['tags'] as String,
    previewURL: json['previewURL'] as String,
    previewWidth: json['previewWidth'] as int,
    previewHeight: json['previewHeight'] as int,
    webformatURL: json['webformatURL'] as String,
    webformatWidth: json['webformatWidth'] as int,
    webformatHeight: json['webformatHeight'] as int,
    largeImageURL: json['largeImageURL'] as String,
    fullHDURL: json['fullHDURL'] as String,
    imageURL: json['imageURL'] as String,
    imageWidth: json['imageWidth'] as int,
    imageHeight: json['imageHeight'] as int,
    imageSize: json['imageSize'] as int,
    views: json['views'] as int,
    downloads: json['downloads'] as int,
    favorites: json['favorites'] as int,
    likes: json['likes'] as int,
    comments: json['comments'] as int,
    userId: json['user_id'] as int,
    user: json['user'] as String,
    userImageURL: json['userImageURL'] as String,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageUrl': instance.pageUrl,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'fullHDURL': instance.fullHDURL,
      'imageURL': instance.imageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'favorites': instance.favorites,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };
