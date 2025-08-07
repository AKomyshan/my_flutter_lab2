part of 'counter_bloc.dart';

final class CounterState extends Equatable {
  const CounterState([this.value = 0]);

  final int value;

  CounterState copyWith([int? newValue]) => CounterState(newValue ?? value);

  @override
  List<Object> get props => [value];
}
