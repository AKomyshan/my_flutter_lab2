import 'package:flutter_lab/features/home_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  observers: [TalkerRouteObserver(GetIt.I<Talker>())],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
          path: '/logs',
          builder: (_, __) => TalkerScreen(talker: GetIt.I<Talker>()),
        ),
        GoRoute(path: 'widgets', builder: (_, __) => const WidgetsScreen()),
        GoRoute(
          path: 'navigation',
          builder: (_, __) => const NavigationMainScreen(),
        ),
      ],
    ),
  ],
);