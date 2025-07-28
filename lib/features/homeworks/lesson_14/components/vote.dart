import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum VoteMode { like, dislike }

class Vote extends StatelessWidget {
  const Vote({
    required this.mode,
    required this.isSelected,
    super.key,
  });

  final VoteMode mode;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorFilter =
        isSelected ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null;

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            isSelected ? Color(0xFF2358D1) : Color(0xFFF6F8FD).withAlpha(254),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(24),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: switch (mode) {
        VoteMode.like => SvgPicture.asset(
            isSelected
                ? 'assets/images/like_no_opacity.svg'
                : 'assets/images/like.svg',
            colorFilter: colorFilter,
          ),
        VoteMode.dislike => SvgPicture.asset(
            isSelected
                ? 'assets/images/dislike_no_opacity.svg'
                : 'assets/images/dislike.svg',
            colorFilter: colorFilter,
          ),
      },
    );
  }
}
