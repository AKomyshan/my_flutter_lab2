import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_19/number_input_field.dart';

class HomeworkCubitScreen extends StatefulWidget {
  const HomeworkCubitScreen({super.key});

  @override
  State<HomeworkCubitScreen> createState() => _HomeworkCubitScreenState();
}

class _HomeworkCubitScreenState extends State<HomeworkCubitScreen> {
  final TextEditingController _controller = TextEditingController(text: '0');

  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() => setState(() => _counter--);

  void _resetCounter() => setState(() => _counter = 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('IVE REPAINTED');
    return Scaffold(
      appBar: AppBar(title: const Text('HomeworkCubitScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
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
                    onPressed: () => setState(
                          () => _counter -= int.tryParse(_controller.text) ?? 0,
                    ),
                    child: const Text('-'),
                  ),
                  Expanded(child: NumberInputField(controller: _controller)),
                  ElevatedButton(
                    onPressed: () => setState(
                          () => _counter += int.tryParse(_controller.text) ?? 0,
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
