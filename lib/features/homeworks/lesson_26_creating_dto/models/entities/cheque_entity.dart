import 'package:flutter_lab/features/homeworks/lesson_26_creating_dto/models/dtos/cheque_dto.dart';

class ChequeEntity {
  ChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  ChequeEntity.fromDto(ChequeDto dto)
      : chequeId = dto.chequeHeader.chequeId,
        totalAmount = dto.chequeHeader.sumReg,
        items = dto.chequeLines.map((x) => x.lagerNameUA).toList(),
        prediction = dto.chPrediction;

  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;
}
