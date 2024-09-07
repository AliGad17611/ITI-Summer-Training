import 'dart:developer';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.abc,
            size: 30,
          ),
          onPressed: () {
            log('ABC button pressed');
          },
        ),
        centerTitle: true,
        title: const Text('Hello World'),
        actions: [
          const Icon(Icons.height),
          IconButton(
            icon: Text('$count',
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
