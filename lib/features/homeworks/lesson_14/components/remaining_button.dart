import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';

class RemainingButton extends StatelessWidget {
  const RemainingButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(192),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: MediaQuery.of(context).padding.bottom + 12,
                left: 24,
                right: 24,
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF213A8F),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Надіслати',
                  style: semiBoldTextStyle(20).copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
