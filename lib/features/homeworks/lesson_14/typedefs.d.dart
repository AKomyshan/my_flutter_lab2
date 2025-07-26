import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';

typedef OnCriteriaChangeCallback = void Function(String name, VoteMode vote);

typedef OnCriteriaCommentChangeCallback = void Function(
  String name,
  String comment,
);

typedef OnRatingChangeCallback = void Function(int rating);
