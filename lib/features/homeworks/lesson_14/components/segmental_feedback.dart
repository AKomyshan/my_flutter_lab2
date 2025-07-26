import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/typedefs.d.dart';

class SegmentalFeedback extends StatefulWidget {
  const SegmentalFeedback({
    required this.title,
    required this.criterias,
    required this.onCriteriaChange,
    this.onCriteriaCommentChangeCallback,
    super.key,
  });

  final String title;
  final List<String> criterias;
  final OnCriteriaChangeCallback onCriteriaChange;
  final OnCriteriaCommentChangeCallback? onCriteriaCommentChangeCallback;

  @override
  State<SegmentalFeedback> createState() => _SegmentalFeedbackState();
}

class _SegmentalFeedbackState extends State<SegmentalFeedback> {
  bool isSomeVoteSelected = false;

  void _handleCriteriaChange(String name, VoteMode vote) {
    widget.onCriteriaChange(name, vote);
    setState(() => isSomeVoteSelected = true);
  }

  void _handleCommentChange(String text) {
    widget.onCriteriaCommentChangeCallback?.call(widget.title, text);
  }

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
            children: [
              ...widget.criterias.map(
                (x) => Criteria(
                  title: x,
                  onCriteriaChange: _handleCriteriaChange,
                ),
              ),
              isSomeVoteSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomTextField(
                        hint: 'Розкажіть докладніше',
                        onChanged: _handleCommentChange,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
