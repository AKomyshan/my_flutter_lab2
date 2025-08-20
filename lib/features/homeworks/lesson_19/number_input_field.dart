import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({required this.controller, super.key});

  final TextEditingController controller;

  void _increment() {
    controller.text = ((int.tryParse(controller.text) ?? 0) + 1).toString();
  }

  void _decrement() {
    controller.text = ((int.tryParse(controller.text) ?? 0) - 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: 'Enter a number',
        suffixIcon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              child: IconButton(
                onPressed: _increment,
                icon: const Icon(Icons.arrow_drop_up),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            SizedBox(
              height: 24,
              child: IconButton(
                onPressed: _decrement,
                icon: const Icon(Icons.arrow_drop_down),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
