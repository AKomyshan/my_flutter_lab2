import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.squaredTop = false,
    this.radius = 24,
    this.backgroundColor = Colors.white,
    this.boxShadowAlpha = 0.06,
    this.height,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  // I use this property to avoid breaking the logic of appBar
  // and to not bother with SafeArea.
  // I would even suggest that this property should not exist at all...
  // But design...
  final bool squaredTop;
  final Color backgroundColor;
  final double boxShadowAlpha;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: squaredTop
            ? BorderRadius.vertical(bottom: Radius.circular(radius))
            : BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: boxShadowAlpha),
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
