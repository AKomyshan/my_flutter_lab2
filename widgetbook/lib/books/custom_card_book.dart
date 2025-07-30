import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:flutter_lab/features/homeworks/lesson_14/components/custom_card.dart';

@widgetbook.UseCase(name: 'Default', type: CustomCard)
Widget buildCustomCardUseCase(BuildContext context) {
  return CustomCard(
    squaredTop: context.knobs.boolean(label: 'Squared top'),
    backgroundColor: context.knobs.color(
      label: 'Background color',
      initialValue: Colors.red,
    ),
    boxShadowAlpha: context.knobs.double.slider(
      label: 'Box shadow alpha',
      min: 0,
      max: 1,
      initialValue: 0.06,
    ),
    height: context.knobs.doubleOrNull.input(
      label: 'Height',
      initialValue: null,
    ),
    child: Text(
      context.knobs.string(label: 'Text', initialValue: 'initialValue'),
    ),
  );
}
