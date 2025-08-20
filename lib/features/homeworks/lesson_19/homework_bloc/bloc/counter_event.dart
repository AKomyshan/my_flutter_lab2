part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

final class CounterIncrementEvent extends CounterEvent {}

final class CounterDecrementEvent extends CounterEvent {}

final class CounterResetEvent extends CounterEvent {}

final class CounterAddEvent extends CounterEvent {
  const CounterAddEvent(this.value);

  final int value;
}
