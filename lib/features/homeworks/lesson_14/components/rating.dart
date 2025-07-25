import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnRatingChangeCallback = void Function(int rating);

class Rating extends StatefulWidget {
  const Rating({super.key, this.onChange});

  final OnRatingChangeCallback? onChange;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  // Brand/500 with ~20% opacity
  final Color _glowColor = const Color(0x33FF8200);

  int _currentRating = 0;

  void _handleStarTap(int tappedRating) {
    setState(() {
      _currentRating = tappedRating;
    });
    widget.onChange?.call(tappedRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (i) {
          final starNumber = i + 1;
          final isFilled = starNumber <= _currentRating;
          return GestureDetector(
            onTap: () => _handleStarTap(starNumber),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: isFilled
                    ? <BoxShadow>[
                        BoxShadow(
                          blurRadius: 14.4,
                          color: _glowColor,
                          spreadRadius: -16,
                        ),
                      ]
                    : null,
              ),
              child: SvgPicture.asset(
                'assets/images/star.svg',
                fit: BoxFit.contain,
                colorFilter: isFilled
                    ? null
                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
          );
        },
      ),
    );
  }
}
