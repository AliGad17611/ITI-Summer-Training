import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, '/nav_bar');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Text(
          'This App Is final project of ITI.\nDeveloped By: Ali Gad \n Thanks for using it',
          style: TextStyle(
              color: kDefaultColor, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          
        ),
      ),
    );
  }
}
