import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrementEvent>(
      (_, emit) => emit(state.copyWith(state.value + 1)),
    );

    on<CounterDecrementEvent>(
      (_, emit) => emit(state.copyWith(state.value - 1)),
    );

    on<CounterAddEvent>(
      (event, emit) => emit(state.copyWith(state.value + event.value)),
    );

    on<CounterResetEvent>((_, emit) => emit(const CounterState()));
  }
}
