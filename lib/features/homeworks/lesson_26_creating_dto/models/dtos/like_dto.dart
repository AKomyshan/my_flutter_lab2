import 'package:json_annotation/json_annotation.dart';

part 'like_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LikeDto {
  LikeDto({required this.contains});

  factory LikeDto.fromJson(Map<String, dynamic> json) =>
      _$LikeDtoFromJson(json);

  final bool contains;

  Map<String, dynamic> toJson() => _$LikeDtoToJson(this);
}
