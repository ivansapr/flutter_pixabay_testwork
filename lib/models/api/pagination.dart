import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import '../image.dart';

part 'pagination.g.dart';

@JsonSerializable()
class PaginationModel extends Equatable {
  PaginationModel({
    this.total,
    this.totalHints,
    this.hits,
  });

  final int total;
  final int totalHints;
  final List<ImageModel> hits;

  static PaginationModel fromJson(dynamic json) =>
      _$PaginationModelFromJson(json);

  @override
  List<Object> get props => [total, totalHints, hits];
}
