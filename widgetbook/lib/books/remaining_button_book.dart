import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:flutter_lab/features/homeworks/lesson_14/components/remaining_button.dart';

@widgetbook.UseCase(name: 'Default', type: RemainingButton)
Widget buildRemainingButtonUseCase(BuildContext context) {
  return RemainingButton(onPressed: () => {});
}
