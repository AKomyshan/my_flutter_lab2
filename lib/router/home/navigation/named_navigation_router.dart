import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:go_router/go_router.dart';

enum NamedNavigationRoutes {
  simpleNewScreen('/new_screen', 'named_simple_new_screen'),
  simpleScreenWithData(
    '/simple_screen_with_data_named',
    'named_simple_screen_with_data',
  );

  const NamedNavigationRoutes(this.path, this.name);

  final String path;
  final String name;
}

final namedRoutesNavigationExampleRoutes = <RouteBase>[
  GoRoute(
    path: NamedNavigationRoutes.simpleNewScreen.path,
    name: NamedNavigationRoutes.simpleNewScreen.name,
    builder: (_, __) => const SimpleEmptyScreen(),
  ),
  GoRoute(
    path: NamedNavigationRoutes.simpleScreenWithData.path,
    name: NamedNavigationRoutes.simpleScreenWithData.name,
    builder: (context, state) {
      final data = state.extra as String?;
      return SimpleScreenWithData(id: data ?? 'No data provided');
    },
  ),
];
