import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Task View'),
      ),
      body: const Center(
        child:  Text('Task View'),
      ),
    );
  }
}