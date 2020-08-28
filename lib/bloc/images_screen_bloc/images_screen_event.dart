import 'package:equatable/equatable.dart';

import '../../models/colors.dart';

abstract class ImagesScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ImagesFetch extends ImagesScreenEvent {
  ImagesFetch({this.color});
  final AcceptedColor color;

  @override
  List<Object> get props => [color];
}

class ImagesFetchNextPage extends ImagesScreenEvent {}
