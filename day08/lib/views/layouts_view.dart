import 'package:day08/views/archieved_view.dart';
import 'package:day08/views/done_view.dart';
import 'package:day08/views/task_view.dart';
import 'package:day08/views/test_view.dart';
import 'package:flutter/material.dart';

class LayoutsView extends StatefulWidget {
  const LayoutsView({super.key});

  @override
  State<LayoutsView> createState() => _LayoutsViewState();
}

class _LayoutsViewState extends State<LayoutsView> {
  int currentIndex = 0;
  List<Widget> list = [
    const TaskView(),
    const DoneView(),
    const ArchievedView(),
    const TestView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.done),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.archive),
            label: 'Archived',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
