import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';

class NavigationMainScreen extends StatelessWidget {
  const NavigationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationCard(
            title: 'Base Navigation Section',
            description: '',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => const BaseNavigationSectionScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
