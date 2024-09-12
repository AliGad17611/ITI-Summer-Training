import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key,
      required this.passwordController,
      this.labelText = 'Password',
      this.validator});
  final TextEditingController passwordController;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: widget.passwordController,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: isObscure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
