import 'package:flutter_lab/features/home_screen.dart';
import 'package:flutter_lab/router/home/home_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

enum AppRoutes {
  home('/', 'home');

  const AppRoutes(this.path, this.name);

  final String path;
  final String name;
}

final router = GoRouter(
  observers: [TalkerRouteObserver(GetIt.I<Talker>())],
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (_, __) => const HomeScreen(),
      routes: homeSubRoutes,
    ),
  ],
);
