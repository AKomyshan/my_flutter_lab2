// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/books/custom_card_book.dart' as _i3;
import 'package:widgetbook_workspace/books/full_result.dart' as _i2;
import 'package:widgetbook_workspace/books/rating_book.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'homeworks',
        children: [
          _i1.WidgetbookFolder(
            name: 'lesson_14',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'Homework14Screen',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i2.buildRatingUseCase,
                ),
              ),
              _i1.WidgetbookFolder(
                name: 'components',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'CustomCard',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i3.buildCustomCardUseCase,
                    ),
                  ),
                  _i1.WidgetbookLeafComponent(
                    name: 'Rating',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i4.buildRatingUseCase,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
