import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_number_field.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController numberController = TextEditingController();
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
              'Enter your phone number and you will receive a code to reset your password',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomNumberField(
              controller: numberController,
              labelText: 'Phone Number',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Send Code',
              onPressed: () {
                Navigator.pushNamed(context, '/otp_verification');
              },
            ),
          ],
        ),
      ),
    );
  }
}
