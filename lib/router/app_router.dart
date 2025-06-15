import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
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
