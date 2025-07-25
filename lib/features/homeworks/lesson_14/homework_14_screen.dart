import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/dtos/feedback_dto.dart';
import 'package:logger/logger.dart';

const int backgroundColor = 0xffEEF2FC;
const double defaultSpacing = 8.0;
final logger = Logger();

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  final request = FeedbackDto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.only(
                        // to be sure that 'pull to refresh' case won't break
                        // the app bar and the first widget
                        top: kToolbarHeight +
                            MediaQuery.of(context).padding.top -
                            10,
                      ),
                      child: Column(
                        spacing: defaultSpacing,
                        children: [
                          CustomCard(
                            squaredTop: true,
                            child: Rating(
                              onChange: (rating) =>
                                  setState(() => request.rating = rating),
                            ),
                          ),
                          CustomCard(child: SegmentalFeedback()),
                          CustomCard(child: SegmentalFeedback()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: RemainingButton(onPressed: () => logger.d(request)),
          ),
        ],
      ),
    );
  }
}
