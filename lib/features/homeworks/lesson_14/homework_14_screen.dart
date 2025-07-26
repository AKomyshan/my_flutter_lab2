import 'package:flutter/material.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/components/index.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/dtos/feedback_request_dto.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/get_criteria.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/theme.dart';
import 'package:logger/logger.dart';

const int backgroundColor = 0xffEEF2FC;
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class Homework14Screen extends StatefulWidget {
  const Homework14Screen({super.key});

  @override
  State<Homework14Screen> createState() => _Homework14ScreenState();
}

class _Homework14ScreenState extends State<Homework14Screen> {
  final _request = FeedbackRequestDto();
  final Future<Map<int, CriteriaDto>> _criteriaFuture = getCriteria();

  // name it should be something like id in real life (Обсулуговування e.g.)
  // entryTitle it also should be some id for criteria category (Випічка e.g.)
  void _handeCriteriaChange(String name, VoteMode vote, String entryTitle) {
    _validateCriteriaExistsOrCreateNew(entryTitle);
    _request.criterias[entryTitle]!.votes[name] = vote;
  }

  void _handeCriteriaCommentChange(
    String name,
    String comment,
    String entryTitle,
  ) {
    _validateCriteriaExistsOrCreateNew(entryTitle);
    _request.criterias[entryTitle]!.comment = comment;
  }

  void _validateCriteriaExistsOrCreateNew(String entryTitle) {
    final isCriteriaExists = _request.criterias.keys.contains(entryTitle);
    if (!isCriteriaExists) {
      _request.criterias[entryTitle] = CriteriaRequestDto();
    }
  }

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
            remaining: RemainingButton(onPressed: () => logger.i(_request)),
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
                    onCriteriaChange: (name, vote) => _handeCriteriaChange(
                      name,
                      vote,
                      entry.value.title,
                    ),
                    onCriteriaCommentChangeCallback: (name, comment) =>
                        _handeCriteriaCommentChange(
                      name,
                      comment,
                      entry.value.title,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
