import 'package:equatable/equatable.dart';

enum RateAppStatus { initial, loading, success, error }

final class RateAppState extends Equatable {
  const RateAppState({
    this.rating = 0,
    this.status = RateAppStatus.initial,
  });

  final int rating;
  final RateAppStatus status;

  RateAppState copyWith({
    int? rating,
    RateAppStatus? status,
  }) {
    return RateAppState(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [rating, status];

  @override
  String toString() {
    return 'Rating: $rating | Status: $status';
  }
}
