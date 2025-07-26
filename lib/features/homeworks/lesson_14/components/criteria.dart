import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/extensions/widget_extensions.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';

class Criteria extends StatefulWidget {
  const Criteria({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<Criteria> createState() => _CriteriaState();
}

class _CriteriaState extends State<Criteria> {
  VoteMode? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF13131E).withAlpha(8), width: 1),
      ),
      child: Row(
        spacing: 12,
        children: [
          Expanded(child: Text(widget.title, style: regularTextStyle(16))),
          Vote(mode: VoteMode.dislike, isSelected: selected == VoteMode.dislike)
              .withOnTap(() => setState(() => selected = VoteMode.dislike)),
          Vote(mode: VoteMode.like, isSelected: selected == VoteMode.like)
              .withOnTap(() => setState(() => selected = VoteMode.like)),
        ],
      ),
    ).fullWidth();
  }
}
