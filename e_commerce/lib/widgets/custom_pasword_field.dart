import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.passwordController});
  final TextEditingController passwordController;

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
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password must not be empty';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
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
