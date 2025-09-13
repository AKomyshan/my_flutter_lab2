import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_cubit.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/counter_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(create: (_) => RateAppCubit()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
  }
}
