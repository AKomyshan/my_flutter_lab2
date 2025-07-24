import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/custom_card.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';

const int backgroundColor = 0xffEEF2FC;

class Homework14Screen extends StatelessWidget {
  const Homework14Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const FeedbackScreenTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomCard(
                squaredTop: true,
                child: Text('fsdaa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
