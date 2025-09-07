// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeDto _$ChequeDtoFromJson(Map<String, dynamic> json) => ChequeDto(
      chequeHeader: ChequeHeaderDto.fromJson(
          json['chequeHeader'] as Map<String, dynamic>),
      sumDiscount: (json['sumDiscount'] as num).toDouble(),
      chequeLines: (json['chequeLines'] as List<dynamic>)
          .map((e) => ChequeLineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chequeActions: (json['chequeActions'] as List<dynamic>)
          .map((e) => ChequeActionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chPrediction: json['chPrediction'] as String,
      sumCashback: (json['sumCashback'] as num).toInt(),
      chequeMagicName: json['chequeMagicName'] as String,
    );

Map<String, dynamic> _$ChequeDtoToJson(ChequeDto instance) => <String, dynamic>{
      'chequeHeader': instance.chequeHeader.toJson(),
      'sumDiscount': instance.sumDiscount,
      'chequeLines': instance.chequeLines.map((e) => e.toJson()).toList(),
      'chequeActions': instance.chequeActions.map((e) => e.toJson()).toList(),
      'chPrediction': instance.chPrediction,
      'sumCashback': instance.sumCashback,
      'chequeMagicName': instance.chequeMagicName,
    };
