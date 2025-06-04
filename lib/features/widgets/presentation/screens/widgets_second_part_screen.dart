import 'package:flutter/material.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/custom_widgets_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/gesture_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/text_field_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/widget_types_example_screen.dart';

class WidgetsSecondPartScreen extends StatelessWidget {
  const WidgetsSecondPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Part 2'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          WidgetExampleCard(
            title: 'Custom Widgets',
            description:
                'Learn how to create reusable custom widgets to avoid code '
                'duplication and improve maintainability.',
            exampleScreen: CustomWidgetsExampleScreen(),
          ),
          WidgetExampleCard(
            title: 'Stateless vs Stateful Widgets',
            description:
                'Understanding the fundamental types of widgets in Flutter and '
                'when to use each one.',
            exampleScreen: WidgetTypesExampleScreen(),
          ),
          WidgetExampleCard(
            title: 'GestureDetector & InkWell',
            description:
                'Widgets for handling touch gestures and creating interactive '
                'elements with material design ink effects.',
            exampleScreen: GestureExampleScreen(),
          ),
          WidgetExampleCard(
            title: 'TextFields & TextFormField',
            description:
                'Input widgets for text entry with various styles, validation, '
                'and form integration capabilities.',
            exampleScreen: TextFieldExampleScreen(),
          ),
        ],
      ),
    );
  }
}

// Reuse the WidgetExampleCard from basic_widgets_screen.dart
class WidgetExampleCard extends StatelessWidget {
  const WidgetExampleCard({
    required this.title,
    required this.description,
    required this.exampleScreen,
    super.key,
  });
  final String title;
  final String description;
  final Widget exampleScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(builder: (context) => exampleScreen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
