import 'package:flutter/material.dart';

class CustomNumberField extends StatelessWidget {
  const CustomNumberField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.enabled = true});
  final TextEditingController controller;
  final String labelText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'^(\+20|0020)?(010|011|012|015)[0-9]{8}$');
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        // Default validator for Egyptian phone numbers
        else if (!regex.hasMatch(value)) {
          return 'Please enter a valid Egyptian phone number';
        }
        return null;
      },
      enabled: enabled,
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.numbers),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
