import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_state.dart';

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(const RateAppState());

  void rate(int rating) => emit(state.copyWith(rating: rating));

  void reset() => emit(state.copyWith(rating: 0));

  Future<void> save() async {
    emit(state.copyWith(status: RateAppStatus.loading));

    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    } finally {
      emit(state.copyWith(status: RateAppStatus.success));
    }
  }
}
