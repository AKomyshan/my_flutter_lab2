import 'package:flutter_lab/features/widgets/presentation/widgets/part2/custom_widgets_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/gesture_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/images_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/text_field_example_screen.dart';
import 'package:flutter_lab/features/widgets/presentation/widgets/part2/widget_types_example_screen.dart';
import 'package:go_router/go_router.dart';

enum WidgetsSecondPartRoutes {
  customWidgets('/custom_widgets', 'widgets_part2_custom_widgets'),
  widgetTypes('/widget_types', 'widgets_part2_widget_types'),
  gesture('/gesture', 'widgets_part2_gesture'),
  textField('/text_field', 'widgets_part2_text_field'),
  images('/images', 'widgets_part2_images');

  const WidgetsSecondPartRoutes(this.path, this.name);

  final String path;
  final String name;
}

final widgetsSecondPartExampleRoutes = <RouteBase>[
  GoRoute(
    path: WidgetsSecondPartRoutes.customWidgets.path,
    name: WidgetsSecondPartRoutes.customWidgets.name,
    builder: (_, __) => const CustomWidgetsExampleScreen(),
  ),
  GoRoute(
    path: WidgetsSecondPartRoutes.widgetTypes.path,
    name: WidgetsSecondPartRoutes.widgetTypes.name,
    builder: (_, __) => const WidgetTypesExampleScreen(),
  ),
  GoRoute(
    path: WidgetsSecondPartRoutes.gesture.path,
    name: WidgetsSecondPartRoutes.gesture.name,
    builder: (_, __) => const GestureExampleScreen(),
  ),
  GoRoute(
    path: WidgetsSecondPartRoutes.textField.path,
    name: WidgetsSecondPartRoutes.textField.name,
    builder: (_, __) => const TextFieldExampleScreen(),
  ),
  GoRoute(
    path: WidgetsSecondPartRoutes.images.path,
    name: WidgetsSecondPartRoutes.images.name,
    builder: (_, __) => const ImageExampleScreen(),
  ),
];
