import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/simple_empty_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/simple_screen_with_data.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/navigation_button.dart';

class BaseNavigationSectionScreen extends StatelessWidget {
  const BaseNavigationSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base Navigation Section'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavagationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleEmptyScreen(),
                ),
              );
            },
          ),
          NavagationButton(
            title: 'Transition with arguments',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleScreenWithData(id: '123'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
