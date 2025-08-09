import 'package:flutter_lab/features/widgets/presentation/widgets/part1/align_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/buttons_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/center_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/column_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/container_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/expanded_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/padding_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/progress_indicators_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/row_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/scroll_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/sized_box_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/stack_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part1/text_example_screen.dart';
import 'package:go_router/go_router.dart';

enum Part1Routes {
  container('/container', 'widgets_part1_container'),
  row('/row', 'widgets_part1_row'),
  column('/column', 'widgets_part1_column'),
  expanded('/expanded', 'widgets_part1_expanded'),
  stack('/stack', 'widgets_part1_stack'),
  sizedBox('/sized_box', 'widgets_part1_sized_box'),
  padding('/padding', 'widgets_part1_padding'),
  align('/align', 'widgets_part1_align'),
  center('/center', 'widgets_part1_center'),
  text('/text', 'widgets_part1_text'),
  buttons('/buttons', 'widgets_part1_buttons'),
  scroll('/scroll', 'widgets_part1_scroll'),
  progressIndicators(
    '/progress_indicators',
    'widgets_part1_progress_indicators',
  );

  const Part1Routes(this.path, this.name);

  final String path;
  final String name;
}

final widgetsFirstPartExampleRoutes = <RouteBase>[
  GoRoute(
    path: Part1Routes.container.path,
    name: Part1Routes.container.name,
    builder: (_, __) => const ContainerExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.row.path,
    name: Part1Routes.row.name,
    builder: (_, __) => const RowExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.column.path,
    name: Part1Routes.column.name,
    builder: (_, __) => const ColumnExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.expanded.path,
    name: Part1Routes.expanded.name,
    builder: (_, __) => const ExpandedExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.stack.path,
    name: Part1Routes.stack.name,
    builder: (_, __) => const StackExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.sizedBox.path,
    name: Part1Routes.sizedBox.name,
    builder: (_, __) => const SizedBoxExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.padding.path,
    name: Part1Routes.padding.name,
    builder: (_, __) => const PaddingExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.align.path,
    name: Part1Routes.align.name,
    builder: (_, __) => const AlignExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.center.path,
    name: Part1Routes.center.name,
    builder: (_, __) => const CenterExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.text.path,
    name: Part1Routes.text.name,
    builder: (_, __) => const TextExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.buttons.path,
    name: Part1Routes.buttons.name,
    builder: (_, __) => const ButtonsExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.scroll.path,
    name: Part1Routes.scroll.name,
    builder: (_, __) => const ScrollExampleScreen(),
  ),
  GoRoute(
    path: Part1Routes.progressIndicators.path,
    name: Part1Routes.progressIndicators.name,
    builder: (_, __) => const ProgressIndicatorsExampleScreen(),
  ),
];
