import 'package:flutter_lab/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/screens/widgets_main_screen.dart';
import 'package:flutter_lab/router/home/widgets/widgets_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

enum HomeRoutes {
  home('/', 'home'),
  logs('/logs', 'logs'),
  widgets('/widgets', 'widgets'),
  navigation('/navigation', 'navigation');

  const HomeRoutes(this.path, this.name);

  final String path;
  final String name;
}

final homeSubRoutes = <RouteBase>[
  GoRoute(
    path: HomeRoutes.logs.path,
    name: HomeRoutes.logs.name,
    builder: (_, __) => TalkerScreen(talker: GetIt.I<Talker>()),
  ),
  GoRoute(
    path: HomeRoutes.widgets.path,
    name: HomeRoutes.widgets.name,
    builder: (_, __) => const WidgetsScreen(),
    routes: widgetsSubRoutes,
  ),
  GoRoute(
    path: HomeRoutes.navigation.path,
    name: HomeRoutes.navigation.name,
    builder: (_, __) => const NavigationMainScreen(),
  ),
];
