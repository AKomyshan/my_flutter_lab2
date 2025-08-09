import 'package:flutter_lab/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_second_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_third_part_screen.dart';
import 'package:flutter_lab/router/home/widgets/constraints/constraints_router.dart';
import 'package:flutter_lab/router/home/widgets/part1/part1_router.dart';
import 'package:flutter_lab/router/home/widgets/part2/part2_router.dart';
import 'package:go_router/go_router.dart';

enum WidgetsRoutes {
  widgetsPart1('/part1', 'widgets_part1'),
  widgetsPart2('/part2', 'widgets_part2'),
  constraints('/constraints', 'constraints'),
  homework13('/homework13', 'homework13'),
  homework14('/homework14', 'homework14');

  const WidgetsRoutes(this.path, this.name);

  final String path;
  final String name;
}

final widgetsSubRoutes = <RouteBase>[
  GoRoute(
    path: WidgetsRoutes.widgetsPart1.path,
    name: WidgetsRoutes.widgetsPart1.name,
    builder: (_, __) => const WidgetsFirstPartScreen(),
    routes: widgetsFirstPartExampleRoutes,
  ),
  GoRoute(
    path: WidgetsRoutes.widgetsPart2.path,
    name: WidgetsRoutes.widgetsPart2.name,
    builder: (_, __) => const WidgetsSecondPartScreen(),
    routes: widgetsSecondPartExampleRoutes,
  ),
  GoRoute(
    path: WidgetsRoutes.constraints.path,
    name: WidgetsRoutes.constraints.name,
    builder: (_, __) => const WidgetsThirdPartScreen(),
    routes: widgetsThirdPartExampleRoutes,
  ),
  GoRoute(
    path: WidgetsRoutes.homework13.path,
    name: WidgetsRoutes.homework13.name,
    builder: (_, __) => const Homework13Screen(),
  ),
  GoRoute(
    path: WidgetsRoutes.homework14.path,
    name: WidgetsRoutes.homework14.name,
    builder: (_, __) => const Homework14Screen(),
  ),
];
