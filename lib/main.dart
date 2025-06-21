import 'package:flutter/material.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:flutter_lab/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
