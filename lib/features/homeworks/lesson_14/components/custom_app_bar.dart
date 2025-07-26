import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';

// see: https://ckreymborg.medium.com/how-to-create-a-glassmorphism-frosted-glass-appbar-in-flutter-fb217ce1b4ca
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(
        double.infinity,
        kToolbarHeight,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            title: const FeedbackScreenTitle(),
            backgroundColor: Colors.white.withAlpha(200),
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
