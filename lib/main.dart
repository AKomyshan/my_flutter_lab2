import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lab/router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    _initDependencies();
    runApp(const FlutterWidgetsApp());
  }, (Object error, StackTrace stack) {
    GetIt.I<Talker>().handle(error, stack, 'Uncaught app exception');
  });
}

void _initDependencies() {
  GetIt.I.registerSingleton<Talker>(TalkerFlutter.init());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
