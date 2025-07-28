import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';

class FeedbackScreenTitle extends StatelessWidget {
  const FeedbackScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Оцінка візиту до магазину',
      style: semiBoldTextStyle(20),
    );
  }
}
