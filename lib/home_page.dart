import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice/dice_icon_button.dart';
import 'package:roll_dice/main.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.title,
  });

  // adding additional constructor to the widget
  const HomeScreenWidget.defaultColoring({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeScreenWidget> {
  int _diceRolledNumber = 0;

  void _rollDice() {
    setState(() {
      _diceRolledNumber = 1 + Random().nextInt(6);
    });
  }

  void _resetApp() {
    setState(() {
      _diceRolledNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String additionalText;
    bool diceIsAlreadyRolled;
    if (_diceRolledNumber > 0 && _diceRolledNumber < 7) {
      additionalText = "The dice you rolled";
      diceIsAlreadyRolled = true;
    } else {
      additionalText = "Please roll the dice";
      diceIsAlreadyRolled = false;
    }

    return Scaffold(
      body: Container(
        // to make the container takes all the screen size
        alignment: Alignment.center,
        decoration: appBoxDecoration,
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
            Text(
              additionalText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            DiceIconButton(
              rollDiceFunction: _rollDice,
              rolledNumber: _diceRolledNumber,
              isDiceRolled: diceIsAlreadyRolled,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Reset the app",
        onPressed: _resetApp,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
