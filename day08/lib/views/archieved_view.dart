import 'package:flutter/material.dart';

class ArchievedView extends StatelessWidget {
  const ArchievedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archieved View'),
      ),
      body: const Center(
        child: Text('Archieved View'),
      ),
    );
  }
}
