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
    final counterBlock = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('HomeworkBlocScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) => state.value,
              builder: (_, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterDecrementEvent()),
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterResetEvent()),
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterIncrementEvent()),
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
                    onPressed: () => counterBlock.add(
                      CounterAddEvent(-(int.tryParse(_controller.text) ?? 0)),
                    ),
                    child: const Text('-'),
                  ),
                  Expanded(child: NumberInputField(controller: _controller)),
                  ElevatedButton(
                    onPressed: () => counterBlock.add(
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
