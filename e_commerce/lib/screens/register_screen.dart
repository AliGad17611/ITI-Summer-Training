import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/show_snackbar.dart';
import 'package:e_commerce/services/signup_service.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_email_field.dart';
import 'package:e_commerce/widgets/custom_number_field.dart';
import 'package:e_commerce/widgets/custom_password_field.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Create an instance of the SignUpService
  final SignUpService _signUpService = SignUpService();

  // Method to handle user registration
  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _signUpService.signUp(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
          phone: _phoneController.text,
        );
        // Navigate to home screen if registration is successful
        if (!mounted) return;
        Navigator.pushNamed(context, 'home_view');
      } catch (e) {
        if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
          showSnackBar(context, 'The account already exists for that email.');
        } else {
          showSnackBar(context, 'Something went wrong.');
        }
      }
    }
  }

  // Utility method to show snackbars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Image.asset('assets/images/freed.png'),
                  ),
                  const SizedBox(height: 20),
                  CustomEmailField(emailController: _emailController),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomNumberField(
                    controller: _phoneController,
                    labelText: 'Phone Number',
                  ),
                  const SizedBox(height: 15),
                  CustomPasswordField(
                    passwordController: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomPasswordField(
                    labelText: 'Confirm Password',
                    passwordController: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Register',
                    onPressed: register, // Call the register function
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
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
            ),
          ),
        ),
      ),
    );
  }
}
