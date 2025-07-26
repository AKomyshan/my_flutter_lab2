import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget fullWidth() => SizedBox(width: double.infinity, child: this);

  Widget withOnTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }
}
