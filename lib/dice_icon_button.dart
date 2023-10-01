import 'package:flutter/material.dart';

class DiceIconButton extends StatelessWidget {
  const DiceIconButton({
    super.key,
    required this.rollDiceFunction,
    required this.rolledNumber,
    required this.isDiceRolled,
  });

  final VoidCallback rollDiceFunction;
  final int rolledNumber;
  final bool isDiceRolled;

  @override
  Widget build(BuildContext context) {
    Widget childIcon;

    if (isDiceRolled) {
      childIcon = Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
          ),
          onPressed: rollDiceFunction,
          child: Text(
            "The rolled number is: $rolledNumber,\n"
            "Roll Dice again?",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      childIcon = Center(
        child: ElevatedButton(
          onPressed: rollDiceFunction,
          child: const Text(
            "Roll Dice",
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return childIcon;
  }
}
