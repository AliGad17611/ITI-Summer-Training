import 'package:flutter/material.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done View'),
      ),
      body: const Center(
        child: Text('Done View'),
      ),
    );
  }
}