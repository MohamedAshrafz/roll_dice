import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.title,
    required this.colorGradientList,
  });

  // adding additional constructor to the widget
  const HomeScreenWidget.defaultColoring({super.key, required this.title})
      : colorGradientList = const [
          Colors.purple,
          Colors.blue,
        ];

  final String title;
  final List<Color> colorGradientList;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeScreenWidget> {
  int _diceRolledNumber = 0;

  void addOneToTheCounter() {
    setState(() {
      _diceRolledNumber = 1 + Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colorGradientList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "The dice you rolled",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            IconButton(
              onPressed: addOneToTheCounter,
              icon: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/images/dice-$_diceRolledNumber.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
