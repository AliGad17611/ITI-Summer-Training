import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  TextEditingController resetCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              'Reset Password',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kDefaultColor),
            ),
            const SizedBox(
              height: 80,
            ),

            //CustomNumberField(
            //   controller: resetCodeController,
            //   labelText: 'Reset Code',
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            CustomPasswordField(passwordController: newPasswordController),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordField(
              passwordController: confirmPasswordController,
              labelText: 'Confirm Password',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Reset Password',
              onPressed: () {
                Navigator.pushNamed(context, '/nav_bar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
