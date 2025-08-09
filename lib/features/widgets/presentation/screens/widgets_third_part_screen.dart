import 'package:flutter/material.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:flutter_lab/router/home/widgets/constraints/constraints_router.dart';
import 'package:go_router/go_router.dart';

class WidgetsThirdPartScreen extends StatelessWidget {
  const WidgetsThirdPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Understanding constraints'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetExampleCard(
            title: 'Example 1',
            description: 'Examples with Container',
            onTap: () => context.goNamed(WidgetsThirdPartRoutes.example1.name),
          ),
          WidgetExampleCard(
            title: 'Example 2',
            description: 'Another example case with Container',
            onTap: () => context.goNamed(WidgetsThirdPartRoutes.example2.name),
          ),
          WidgetExampleCard(
            title: 'Example 3',
            description: 'Examples with Column',
            onTap: () => context.goNamed(WidgetsThirdPartRoutes.example3.name),
          ),
          WidgetExampleCard(
            title: 'Example 4',
            description: 'Examples with Row',
            onTap: () => context.goNamed(WidgetsThirdPartRoutes.example4.name),
          ),
          WidgetExampleCard(
            title: 'Example 5',
            description: 'FittedBox example',
            onTap: () => context.goNamed(WidgetsThirdPartRoutes.example5.name),
          ),
        ],
      ),
    );
  }
}
