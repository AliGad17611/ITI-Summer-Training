import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/screens/about_app.dart';
import 'package:e_commerce/screens/about_developer.dart';
import 'package:e_commerce/screens/bottom_nav_bar.dart';
import 'package:e_commerce/screens/forget_screen.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/screens/onboarding_screen.dart';
import 'package:e_commerce/screens/otp_screen.dart';
import 'package:e_commerce/screens/otp_verification_screen.dart';
import 'package:e_commerce/screens/recovery_screen.dart';
import 'package:e_commerce/screens/register_screen.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/register': (context) => const RegisterScreen(),
        '/forget': (context) => const ForgetScreen(),
        '/recovery': (context) => const RecoveryScreen(),
        '/otp': (context) => const OTPScreen(),
        '/otp_verification': (context) => const OTPVerification(),
        '/nav_bar': (context) => const BottomNavBar(),
        '/about_app': (context) => const AboutApp(),
        '/about_developer': (context) => const AboutDeveloper(),
      },
      title: 'E Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
    );
  }
}
