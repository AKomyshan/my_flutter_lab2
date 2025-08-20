import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterCubitState());

  void increment() => emit(state.copyWith(state.value + 1));

  void decrement() => emit(state.copyWith(state.value - 1));

  void reset() => emit(const CounterCubitState());

  void add(int value) {
    if (value == 0) return;

    emit(state.copyWith(state.value + value));
  }
}
