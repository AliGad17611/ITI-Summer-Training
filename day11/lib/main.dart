import 'package:day11/firebase_options.dart';
import 'package:day11/pages/login_page.dart';
import 'package:day11/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/registerPage': (context) => const RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
