import 'package:flutter/material.dart';

class FeedbackScreenTitle extends StatelessWidget {
  const FeedbackScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Оцінка візиту до магазину',
      style: TextStyle(
        fontFamily: 'SilpoText',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
