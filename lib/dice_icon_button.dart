import 'package:flutter/material.dart';

const double diceIconSize = 200.0;

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
      childIcon = Image.asset(
        "assets/images/dice-$rolledNumber.png",
      );
    } else {
      childIcon = ElevatedButton(
        onPressed: rollDiceFunction,
        child: const Text(
          "Roll Dice",
          style: TextStyle(fontSize: 25.0),
        ),
      );
    }

    return IconButton(
      tooltip: isDiceRolled? "Dice rolled in this try":"Roll dice",
      onPressed: rollDiceFunction,
      icon: SizedBox(
        width: diceIconSize,
        height: diceIconSize,
        child: childIcon,
      ),
    );
  }
}
