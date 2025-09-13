// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_action_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeActionDto _$ChequeActionDtoFromJson(Map<String, dynamic> json) =>
    ChequeActionDto(
      actionType: (json['actionType'] as num).toInt(),
      actionTypeCodeName: json['actionTypeCodeName'] as String?,
      actionId: (json['actionId'] as num).toInt(),
      discpercent: (json['discpercent'] as num).toInt(),
      discount: (json['discount'] as num).toDouble(),
      varcharData: json['varcharData'] as String?,
    );

Map<String, dynamic> _$ChequeActionDtoToJson(ChequeActionDto instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'actionTypeCodeName': instance.actionTypeCodeName,
      'actionId': instance.actionId,
      'discpercent': instance.discpercent,
      'discount': instance.discount,
      'varcharData': instance.varcharData,
    };
