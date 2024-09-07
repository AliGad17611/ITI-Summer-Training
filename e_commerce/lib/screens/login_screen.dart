import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_email_field.dart';
import 'package:e_commerce/widgets/custom_pasword_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomEmailField(emailController: emailController),
              const SizedBox(
                height: 20,
              ),
              CustomPasswordField(passwordController: passwordController),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'forget_password_view');
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(emailController.text);
                    print(passwordController.text);
                    // Navigator.pushNamed(context, 'home_view');
                  }
                },
                title: 'Login',
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register_view');
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
