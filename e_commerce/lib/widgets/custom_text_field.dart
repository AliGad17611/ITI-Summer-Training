import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.validator,
      required this.controller,
      required this.labelText});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: (labelText == 'Address')
            ? const Icon(Icons.location_on)
            : const Icon(Icons.person),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
