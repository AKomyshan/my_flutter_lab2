import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/navigation_button.dart';
import 'package:flutter_lab/router/home/navigation/named_navigation_router.dart';
import 'package:go_router/go_router.dart';

class NamedRoutesNavigationScreen extends StatelessWidget {
  const NamedRoutesNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Routes Navigation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () =>
                context.goNamed(NamedNavigationRoutes.simpleNewScreen.name),
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () {
              context.goNamed(
                NamedNavigationRoutes.simpleScreenWithData.name,
                extra: 'best_product_id_ever',
              );
            },
          ),
        ],
      ),
    );
  }
}
