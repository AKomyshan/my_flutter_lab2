import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool get isSmScreen => MediaQuery.of(this).size.width <= 320;
}
