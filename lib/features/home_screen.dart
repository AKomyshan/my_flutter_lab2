import 'package:flutter/material.dart';
import 'package:flutter_lab/core_components/feature_card.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => context.go('/widgets'),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => context.go('/navigation'),
            ),
            FeatureCard(title: 'Logs', onTap: () => context.go('/logs')),
          ],
        ),
      ),
    );
  }
}
