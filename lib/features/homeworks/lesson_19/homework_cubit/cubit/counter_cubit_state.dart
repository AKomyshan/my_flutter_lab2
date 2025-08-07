part of 'counter_cubit.dart';

final class CounterCubitState extends Equatable {
  const CounterCubitState([this.value = 0]);

  final int value;

  CounterCubitState copyWith([int? newValue]) =>
      CounterCubitState(newValue ?? value);

  @override
  List<Object> get props => [value];
}
