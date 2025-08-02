import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';

// see: https://ckreymborg.medium.com/how-to-create-a-glassmorphism-frosted-glass-appbar-in-flutter-fb217ce1b4ca
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          title: Text(
            'Оцінка візиту до магазину',
            style: semiBoldTextStyle(20),
          ),
          backgroundColor: Colors.white.withAlpha(200),
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
