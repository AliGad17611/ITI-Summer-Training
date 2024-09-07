import 'dart:math';

import 'package:day07/views/bmi_result.dart';
import 'package:flutter/material.dart';

class BuildBmiView extends StatefulWidget {
  const BuildBmiView({super.key});

  @override
  State<BuildBmiView> createState() => _BuildBmiViewState();
}

class _BuildBmiViewState extends State<BuildBmiView> {
  double height = 180;
  int weight = 60;
  int age = 25;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isMale ? Colors.blue : Colors.grey,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, size: 70),
                            Text('MALE',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isMale ? Colors.grey : Colors.blue,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, size: 70),
                            Text('FEMALE',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        min: 80,
                        max: 220,
                      )
                    ],
                  ))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                heroTag: 'weight add',
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                heroTag: 'weight remove',
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                heroTag: 'age add',
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                heroTag: 'age remove',
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultView(
                      result: result,
                      isMale: isMale,
                      age: age,
                    ),
                  ),
                );
              },
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 27),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
