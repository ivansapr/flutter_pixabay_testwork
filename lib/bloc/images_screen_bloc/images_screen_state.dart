import 'package:equatable/equatable.dart';

import '../../models/colors.dart';
import '../../models/image.dart';

abstract class ImagesScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImagesScreenInitial extends ImagesScreenState {}

class ImagesScreenError extends ImagesScreenState {}

class ImagesScreenLoading extends ImagesScreenState {
  ImagesScreenLoading({this.color});
  final AcceptedColor color;

  @override
  List<Object> get props => [color];
}

class ImagesScreenFetched extends ImagesScreenState {
  ImagesScreenFetched({
    this.images,
    this.hasReachedMax,
    this.page,
    this.color,
    this.isLoading = false,
  });

  final List<ImageModel> images;
  final bool hasReachedMax;
  final int page;
  final AcceptedColor color;
  final bool isLoading;

  ImagesScreenFetched copyWith({
    List<ImageModel> images,
    bool hasReachedMax,
    int page,
    AcceptedColor color,
    bool isLoading,
  }) =>
      ImagesScreenFetched(
        images: images ?? this.images,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        color: color ?? this.color,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [images, hasReachedMax, page, isLoading, color];
}
