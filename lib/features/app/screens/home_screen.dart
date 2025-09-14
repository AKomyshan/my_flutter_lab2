import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/counter_cubit.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          IconButton(
            onPressed: () => _showDialog(context),
            icon: const Icon(Icons.numbers),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => context.goNamed(ScreenNames.widgets),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => context.goNamed(ScreenNames.baseNavigation),
            ),
            FeatureCard(
              title: 'State Management',
              onTap: () => context.goNamed(ScreenNames.stateManagement),
            ),
            FeatureCard(
              title: 'Animations',
              onTap: () => context.goNamed(ScreenNames.animations),
            ),
            FeatureCard(
              title: 'Error Handling',
              onTap: () => context.goNamed(ScreenNames.errorHandling),
            ),
            FeatureCard(
              title: 'Rest API',
              onTap: () => context.goNamed(ScreenNames.restApi),
            ),
            FeatureCard(
              title: 'Top News',
              onTap: () => context.goNamed(ScreenNames.topNews),
            ),
            FeatureCard(
              title: 'Alerts info',
              onTap: () => context.goNamed(ScreenNames.alertsInfo),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter Bloc: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${context.watch<CounterBloc>().state.counter}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter Provider: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${context.watch<CounterProvider>().counter}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter Cubit: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${context.watch<CounterCubit>().state.counter}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Favorite Number: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${context.watch<CounterCubit>().state.favoriteNumber}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
