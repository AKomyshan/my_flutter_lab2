import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';

class SegmentalFeedback extends StatefulWidget {
  const SegmentalFeedback({
    required this.title,
    required this.criterias,
    super.key,
  });

  final String title;
  final List<String> criterias;

  @override
  State<SegmentalFeedback> createState() => _SegmentalFeedbackState();
}

class _SegmentalFeedbackState extends State<SegmentalFeedback> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(widget.title, style: semiBoldTextStyle(16)),
          ),
          Column(
            spacing: 8,
            children: widget.criterias.map((x) => Criteria(title: x)).toList(),
          ),
        ],
      ),
    );
  }
}
