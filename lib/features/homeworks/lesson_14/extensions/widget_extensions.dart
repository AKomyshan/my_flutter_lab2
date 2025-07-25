import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget fullWidth() => SizedBox(width: double.infinity, child: this);
}
