import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_screen_with_returning_data.dart';
import 'package:go_router/go_router.dart';

enum BaseNavigationRoutes {
  simpleEmpty('/simple_empty', 'simple_empty_screen'),
  simpleEmptyCustomTransition(
    '/simple_empty_custom',
    'simple_empty_custom_transition_screen',
  ),
  simpleWithData('/simple_with_data/:id', 'simple_screen_with_data'),
  simpleWithReturningData(
    '/simple_with_returning_data',
    'simple_screen_with_returning_data',
  );

  const BaseNavigationRoutes(this.path, this.name);

  final String path;
  final String name;
}

final baseNavigationSectionExampleRoutes = <RouteBase>[
  GoRoute(
    path: BaseNavigationRoutes.simpleEmpty.path,
    name: BaseNavigationRoutes.simpleEmpty.name,
    builder: (_, __) => const SimpleEmptyScreen(),
  ),
  GoRoute(
    path: BaseNavigationRoutes.simpleEmptyCustomTransition.path,
    name: BaseNavigationRoutes.simpleEmptyCustomTransition.name,
    pageBuilder: (context, state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SimpleEmptyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: BaseNavigationRoutes.simpleWithData.path,
    name: BaseNavigationRoutes.simpleWithData.name,
    builder: (context, state) {
      final id = state.pathParameters['id'];
      return SimpleScreenWithData(id: id ?? 'No ID provided');
    },
  ),
  GoRoute(
    path: BaseNavigationRoutes.simpleWithReturningData.path,
    name: BaseNavigationRoutes.simpleWithReturningData.name,
    builder: (context, state) =>
        const SimpleScreenWithReturningData(guestName: 'Pavlo'),
  ),
];
