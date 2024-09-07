import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/screens/onboarding_screen.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onBoarding': (context) => const OnBoardingScreen(),
        '/login': (context) => const LoginScreen(),
      },
      title: 'E Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
    );
  }
}
