import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/additional_data_dto.dart';
import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/like_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cheque_line_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ChequeLineDto {
  ChequeLineDto({
    required this.chequeLineId,
    required this.lagerId,
    required this.lagerNameUA,
    required this.lagerUnit,
    required this.kolvo,
    required this.priceOut,
    required this.unitText,
    required this.fileName,
    required this.sumCashbackLine,
    required this.additionalData,
    required this.like,
  });

  factory ChequeLineDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeLineDtoFromJson(json);

  final int chequeLineId;
  final int lagerId;
  final String lagerNameUA;
  final String lagerUnit;
  final double kolvo;
  final double priceOut;
  final String unitText;
  final String fileName;
  final int sumCashbackLine;
  final AdditionalDataDto additionalData;
  final LikeDto like;

  Map<String, dynamic> toJson() => _$ChequeLineDtoToJson(this);
}
