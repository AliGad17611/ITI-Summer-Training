import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_email_field.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Forget Password',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kDefaultColor),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Enter your email and you will receive a code to reset your password',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomEmailField(emailController: emailController),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Send Code',
              onPressed: () {
                Navigator.pushNamed(context, '/recovery');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text('OR'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/otp');
                      },
                      child: const Text(
                        'Verify using phone number',
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
