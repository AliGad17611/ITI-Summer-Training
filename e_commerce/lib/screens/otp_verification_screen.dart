import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

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
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kDefaultColor,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Enter your OTP code here',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: 60,
                height: 60,
                textStyle: const TextStyle(
                  fontSize: 24, // Increase the font size here
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kPrimaryColor),
                ),
              ),
              onCompleted: (value) {
                Navigator.pushNamed(context, '/recovery');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Code must not be empty';
                } else if (value.length != 4) {
                  return 'Code must be 4 digits long';
                }
                return null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              focusNode: FocusNode(),
            ),
          ],
        ),
      ),
    );
  }
}
