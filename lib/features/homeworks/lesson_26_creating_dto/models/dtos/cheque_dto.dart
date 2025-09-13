import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/cheque_action_dto.dart';
import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/cheque_header_dto.dart';
import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/cheque_line_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cheque_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ChequeDto {
  ChequeDto({
    required this.chequeHeader,
    required this.sumDiscount,
    required this.chequeLines,
    required this.chequeActions,
    required this.chPrediction,
    required this.sumCashback,
    required this.chequeMagicName,
  });

  factory ChequeDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeDtoFromJson(json);

  final ChequeHeaderDto chequeHeader;
  final double sumDiscount;
  final List<ChequeLineDto> chequeLines;
  final List<ChequeActionDto> chequeActions;
  final String chPrediction;
  final int sumCashback;
  final String chequeMagicName;

  Map<String, dynamic> toJson() => _$ChequeDtoToJson(this);
}
