import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:go_router/go_router.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureCard(
              title: 'AnimatedBox Playground',
              onTap: () => context.goNamed(ScreenNames.animatedBoxPlayground),
            ),
          ],
        ),
      ),
    );
  }
}
