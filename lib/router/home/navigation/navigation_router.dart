import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';
import 'package:flutter_lab/router/home/navigation/base_navigation_router.dart';
import 'package:flutter_lab/router/home/navigation/named_navigation_router.dart';
import 'package:go_router/go_router.dart';

enum NavigationMainRoutes {
  baseNavigationSection('/base_navigation_section', 'base_navigation_section'),
  namedRoutesNavigation('/named_routes_navigation', 'named_routes_navigation');

  const NavigationMainRoutes(this.path, this.name);

  final String path;
  final String name;
}

final navigationMainScreenRoutes = <RouteBase>[
  GoRoute(
    path: NavigationMainRoutes.baseNavigationSection.path,
    name: NavigationMainRoutes.baseNavigationSection.name,
    builder: (_, __) => const BaseNavigationSectionScreen(),
    routes: baseNavigationSectionExampleRoutes,
  ),
  GoRoute(
    path: NavigationMainRoutes.namedRoutesNavigation.path,
    name: NavigationMainRoutes.namedRoutesNavigation.name,
    builder: (_, __) => const NamedRoutesNavigationScreen(),
    routes: namedRoutesNavigationExampleRoutes,
  ),
];
