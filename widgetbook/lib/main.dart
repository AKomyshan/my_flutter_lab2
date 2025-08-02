import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  static const iPhone5 = ViewportData(
    name: 'iPhone 5/SE (1st Gen)',
    width: 320,
    height: 568,
    pixelRatio: 2,
    platform: TargetPlatform.iOS,
    safeAreas: EdgeInsets.only(top: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        ViewportAddon([...Viewports.all, iPhone5]),
        InspectorAddon(),
        DeviceFrameAddon(devices: Devices.all),
        BuilderAddon(
          name: 'Center',
          builder: (context, child) => Center(child: child),
        ),
      ],
    );
  }
}
