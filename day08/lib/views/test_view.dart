import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
      ),
      body: const Center(
        child:  Text('Test View'),
      ),
    );
  }
}