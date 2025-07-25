import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/dtos/feedback_dto.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/extensions/widget_extensions.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/get_criteria.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';
import 'package:logger/logger.dart';

const int backgroundColor = 0xffEEF2FC;
final logger = Logger();

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  final _request = FeedbackDto();
  final Future<Map<int, CriteriaDto>> _criteriaFuture = getCriteria();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: FutureBuilder<Map<int, CriteriaDto>>(
        future: _criteriaFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return SliverStackView(
            spacing: 8,
            remaining: RemainingButton(onPressed: () => logger.d(_request)),
            children: [
              CustomCard(
                squaredTop: true,
                child: Rating(
                  onChange: (rating) =>
                      setState(() => _request.rating = rating),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Яку оціночку поставите відділам?',
                  style: semiBoldTextStyle(18),
                ),
              ),
              ...snapshot.data!.entries.map(
                (entry) => CustomCard(
                  child: SegmentalFeedback(
                    title: entry.value.title,
                    criterias: entry.value.criterias,
                  ).fullWidth(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
