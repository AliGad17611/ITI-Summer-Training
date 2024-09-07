
import 'package:day10/pages/login_page.dart';
import 'package:day10/pages/register_page.dart';
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
