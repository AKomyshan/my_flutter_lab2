import 'dart:convert';

import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';

class FeedbackRequestDto {
  int id = 1;
  int rating = 0;
  Map<String, CriteriaRequestDto> criterias = {};
  String? additionalComment;

  Map<String, dynamic> toJson() {
    final encodableCriterias = <String, Map<String, dynamic>>{};
    criterias.forEach((key, value) {
      encodableCriterias[key] = value.toJson();
    });

    return {
      'id': id,
      'rating': rating,
      'criterias': encodableCriterias,
      'additionalComment': additionalComment,
    };
  }

  @override
  String toString() {
    final encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(toJson());
  }
}

class CriteriaRequestDto {
  Map<String, VoteMode> votes = {};
  String? comment;

  Map<String, dynamic> toJson() {
    final encodableVotes = <String, String>{};
    votes.forEach((key, value) {
      encodableVotes[key] = value.name;
    });
    return {
      'votes': encodableVotes,
      'comment': comment,
    };
  }
}
