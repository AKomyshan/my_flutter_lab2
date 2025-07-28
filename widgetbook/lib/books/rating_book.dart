import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:flutter_lab/features/homeworks/lesson_14/components/rating.dart';

@widgetbook.UseCase(name: 'Default', type: Rating)
Widget buildRatingUseCase(BuildContext context) {
  return Rating();
}
