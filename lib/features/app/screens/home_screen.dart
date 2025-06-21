import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${context.watch<CounterProvider>().counter}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => context.goNamed(ScreenNames.widgets),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => context.goNamed(ScreenNames.baseNavigation),
            ),
            FeatureCard(
              title: 'State Management',
              onTap: () => context.goNamed(ScreenNames.stateManagement),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
