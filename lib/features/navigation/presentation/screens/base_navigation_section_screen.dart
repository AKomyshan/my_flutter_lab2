import 'package:flutter/material.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/simple_empty_screen.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/simple_screen_with_data.dart';
import 'package:flutter_lab/features/navigation/presentation/screens/simple_screen_with_returning_data.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/navigation_button.dart';

class BaseNavigationSectionScreen extends StatelessWidget {
  const BaseNavigationSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base Navigation Section'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavagationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleEmptyScreen(),
                ),
              );
            },
          ),
          NavagationButton(
            title: 'Transition with arguments',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleScreenWithData(id: '123'),
                ),
              );
            },
          ),
          NavagationButton(
            title: 'Transition with returning data',
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute<String>(
                  builder: (context) =>
                      const SimpleScreenWithReturningData(guestName: 'Pavlo'),
                ),
              );

              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  _createSnackBar(context, result),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

SnackBar _createSnackBar(BuildContext context, String result) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(Icons.card_giftcard, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            result,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    dismissDirection: DismissDirection.none,
  );
}
