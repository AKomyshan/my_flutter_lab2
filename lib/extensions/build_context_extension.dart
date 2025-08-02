import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool get isSmScreen => MediaQuery.sizeOf(this).width <= 320;
}
