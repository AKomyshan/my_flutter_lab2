import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_1.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_2.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_3.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_4.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part3/example_5.dart';
import 'package:go_router/go_router.dart';

enum WidgetsThirdPartRoutes {
  example1('/example1', 'widgets_part3_example1'),
  example2('/example2', 'widgets_part3_example2'),
  example3('/example3', 'widgets_part3_example3'),
  example4('/example4', 'widgets_part3_example4'),
  example5('/example5', 'widgets_part3_example5');

  const WidgetsThirdPartRoutes(this.path, this.name);

  final String path;
  final String name;
}

final widgetsThirdPartExampleRoutes = <RouteBase>[
  GoRoute(
    path: WidgetsThirdPartRoutes.example1.path,
    name: WidgetsThirdPartRoutes.example1.name,
    builder: (_, __) => const UnderstandingConstraintsExample1(),
  ),
  GoRoute(
    path: WidgetsThirdPartRoutes.example2.path,
    name: WidgetsThirdPartRoutes.example2.name,
    builder: (_, __) => const UnderstandingConstraintsExample2(),
  ),
  GoRoute(
    path: WidgetsThirdPartRoutes.example3.path,
    name: WidgetsThirdPartRoutes.example3.name,
    builder: (_, __) => const UnderstandingConstraintsExample3(),
  ),
  GoRoute(
    path: WidgetsThirdPartRoutes.example4.path,
    name: WidgetsThirdPartRoutes.example4.name,
    builder: (_, __) => const UnderstandingConstraintsExample4(),
  ),
  GoRoute(
    path: WidgetsThirdPartRoutes.example5.path,
    name: WidgetsThirdPartRoutes.example5.name,
    builder: (_, __) => const UnderstandingConstraintsExample5(),
  ),
];
