
import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    required this.emailController,this.enabled =true,
  });

  final TextEditingController emailController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      enabled: enabled,
      validator: (value) {
        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (value.isEmpty) {
          return 'Email must not be empty';
        }
        if (!emailValid) {
          return 'Email is not valid';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}
