import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/first_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/naviagation_button.dart';

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const FirstScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
