import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_19/homework_cubit/cubit/counter_cubit.dart';
import 'package:flutter_lab/features/homeworks/lesson_19/number_input_field.dart';

class HomeworkCubitScreen extends StatefulWidget {
  const HomeworkCubitScreen({super.key});

  @override
  State<HomeworkCubitScreen> createState() => _HomeworkCubitScreenState();
}

class _HomeworkCubitScreenState extends State<HomeworkCubitScreen> {
  final _controller = TextEditingController(text: '0');

  int parseIntOrDefault(String test) => int.tryParse(_controller.text) ?? 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('HomeworkCubitScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocSelector<CounterCubit, CounterCubitState, int>(
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
                  onPressed: counterCubit.decrement,
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: counterCubit.reset,
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: counterCubit.increment,
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
                    onPressed: () => counterCubit.add(
                      -parseIntOrDefault(_controller.text),
                    ),
                    child: const Text('-'),
                  ),
                  Expanded(child: NumberInputField(controller: _controller)),
                  ElevatedButton(
                    onPressed: () => counterCubit.add(
                      parseIntOrDefault(_controller.text),
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
