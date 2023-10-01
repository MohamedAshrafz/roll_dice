import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice/dice_icon_button.dart';
import 'package:roll_dice/main.dart';
import 'constants.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
    required this.title,
    required this.colorGradientList,
  });

  /// additional constructor to allow custom color gradient to this specific widget
  const HomeScreenWidget.defaultHomeScreenColoring({super.key, required this.title})
      : colorGradientList = homeScreenColorGradientList;

  const HomeScreenWidget.defaultAppColoring({super.key, required this.title})
      : colorGradientList = null;

  final String title;
  final List<Color>? colorGradientList;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeScreenWidget> {

  int _diceRolledNumber = 0;
  /// To allow using the same Random object many times,
  /// and not making a [new-one] every time we roll the dice.
  final randomizer = Random();

  void _rollDice() {
    setState(() {
      // _diceRolledNumber = 1 + Random().nextInt(6);
      _diceRolledNumber = 1 + randomizer.nextInt(6);
    });
  }

  void _resetApp() {
    setState(() {
      _diceRolledNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDiceRolled;
    if (_diceRolledNumber != 0) {
      isDiceRolled = true;
    } else {
      isDiceRolled = false;
    }

    BoxDecoration localWidgetBoxDecoration = widget.colorGradientList != null
        ? BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colorGradientList!,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )
        : appBoxDecoration;

    return Scaffold(
      body: Container(
        // to make the container takes all the screen size
        alignment: Alignment.center,
        decoration: localWidgetBoxDecoration,
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
              isDiceRolled ? "The dice you rolled" : "Please roll the dice",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            SizedBox.fromSize(
              size: const Size(diceIconSize, diceIconSize),
              child: DiceIconButton(
                rollDiceFunction: _rollDice,
                rolledNumber: _diceRolledNumber,
                isDiceRolled: isDiceRolled,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: isDiceRolled
          ? FloatingActionButton(
              tooltip: "Reset the app",
              onPressed: _resetApp,
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }
}
