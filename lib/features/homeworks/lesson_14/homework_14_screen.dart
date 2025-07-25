import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';

const int backgroundColor = 0xffEEF2FC;

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const FeedbackScreenTitle(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomCard(
                squaredTop: true,
                child: Rating(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
