import 'package:flutter/material.dart';
import 'package:flutter_lab/main.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FlutterWidgetsApp)
Widget buildFlutterWidgetsAppScreenUseCase(BuildContext context) {
  return FlutterWidgetsApp();
}
