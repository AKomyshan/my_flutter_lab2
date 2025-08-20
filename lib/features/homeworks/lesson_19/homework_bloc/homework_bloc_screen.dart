import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_19/homework_bloc/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_19/number_input_field.dart';

class HomeworkBlocScreen extends StatefulWidget {
  const HomeworkBlocScreen({super.key});

  @override
  State<HomeworkBlocScreen> createState() => _HomeworkBlocScreenState();
}

class _HomeworkBlocScreenState extends State<HomeworkBlocScreen> {
  final TextEditingController _controller = TextEditingController(text: '0');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('HomeworkBlocScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) => state.value,
              builder: (_, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => counterBloc.add(CounterDecrementEvent()),
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: () => counterBloc.add(CounterResetEvent()),
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () => counterBloc.add(CounterIncrementEvent()),
                  child: const Text('+1'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => counterBloc.add(
                      CounterAddEvent(-(int.tryParse(_controller.text) ?? 0)),
                    ),
                    child: const Text('-'),
                  ),
                  Expanded(child: NumberInputField(controller: _controller)),
                  ElevatedButton(
                    onPressed: () => counterBloc.add(
                      CounterAddEvent(int.tryParse(_controller.text) ?? 0),
                    ),
                    child: const Text('+'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
