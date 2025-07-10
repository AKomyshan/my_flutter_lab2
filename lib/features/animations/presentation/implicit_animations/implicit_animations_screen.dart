import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Implicit Animations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Implicit animations automatically animate between old and new '
              "values when the widget's properties change. Examples include:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '• AnimatedContainer\n'
              '• AnimatedOpacity\n'
              '• AnimatedPadding\n'
              '• AnimatedPositioned\n'
              '• AnimatedAlign\n'
              '• AnimatedCrossFade\n'
              '• AnimatedDefaultTextStyle\n'
              '• AnimatedSize',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Examples will be added here...',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
