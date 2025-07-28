import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Homework14Screen)
Widget buildHomework14ScreenUseCase(BuildContext context) {
  return Homework14Screen();
}
