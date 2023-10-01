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
      childIcon = SizedBox(
        width: diceIconSize,
        height: diceIconSize,
        child: Image.asset(
          "assets/images/dice-$rolledNumber.png",
        ),
      );
    } else {
      childIcon = ElevatedButton(
        onPressed: rollDiceFunction,
        child: const Text(
          "Roll Dice",
          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        ),
      );
    }

    return IconButton(
      tooltip: isDiceRolled ? "Dice rolled in this try" : "Roll dice",
      onPressed: rollDiceFunction,
      icon: childIcon,
    );
  }
}
