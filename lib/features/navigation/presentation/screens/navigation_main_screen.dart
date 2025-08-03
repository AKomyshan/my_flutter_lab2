import 'package:flutter/material.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:flutter_lab/router/home/navigation/navigation_router.dart';
import 'package:go_router/go_router.dart';

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
            onTap: () => context
                .goNamed(NavigationMainRoutes.baseNavigationSection.name),
          ),
          NavigationCard(
            title: 'Navigation with named routes',
            description: '',
            onTap: () => context
                .goNamed(NavigationMainRoutes.namedRoutesNavigation.name),
          ),
        ],
      ),
    );
  }
}
