import 'dart:convert';

class FeedbackDto {
  int id = 1; // mock
  int rating = 0;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
    };
  }

  @override
  String toString() => jsonEncode(this);
}
