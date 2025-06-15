import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:flutter_lab/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_first_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_second_part_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_third_part_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'widgets',
          name: ScreenNames.widgets,
          builder: (context, state) => const WidgetsScreen(),
          routes: [
            GoRoute(
              path: 'widgets-first-part',
              name: ScreenNames.widgetsFirstPart,
              builder: (context, state) => const WidgetsFirstPartScreen(),
            ),
            GoRoute(
              path: 'widgets-second-part',
              name: ScreenNames.widgetsSecondPart,
              builder: (context, state) => const WidgetsSecondPartScreen(),
            ),
            GoRoute(
              path: 'understanding-constraints',
              name: ScreenNames.understandingConstraints,
              builder: (context, state) => const WidgetsThirdPartScreen(),
            ),
            GoRoute(
              path: 'homework-13',
              name: ScreenNames.homework13,
              builder: (context, state) => const Homework13Screen(),
            ),
            GoRoute(
              path: 'homework-14',
              name: ScreenNames.homework14,
              builder: (context, state) => const Homework14Screen(),
            ),
          ],
        ),
        GoRoute(
          path: 'navigation',
          name: ScreenNames.navigation,
          builder: (context, state) => const NavigationMainScreen(),
        ),
      ],
    ),
  ],
);
