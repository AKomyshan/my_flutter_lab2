import 'package:json_annotation/json_annotation.dart';

part 'cheque_action_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ChequeActionDto {
  ChequeActionDto({
    required this.actionType,
    required this.actionTypeCodeName,
    required this.actionId,
    required this.discpercent,
    required this.discount,
    required this.varcharData,
  });

  factory ChequeActionDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeActionDtoFromJson(json);

  final int actionType;
  final String? actionTypeCodeName;
  final int actionId;
  final int discpercent;
  final double discount;
  final String? varcharData;

  Map<String, dynamic> toJson() => _$ChequeActionDtoToJson(this);
}
