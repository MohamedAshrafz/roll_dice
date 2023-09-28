import 'package:flutter/material.dart';

class DiceIconButton extends StatelessWidget {
  const DiceIconButton({super.key, required this.rollDiceFunction, required this.rolledNumber});

  final Function() rollDiceFunction;
  final int rolledNumber;

  @override
  Widget build(BuildContext context) {
    Widget childIcon;

    if (rolledNumber > 0 && rolledNumber < 7) {
      childIcon = Image.asset(
        "assets/images/dice-$rolledNumber.png",
        width: 200,
        height: 200,
      );
    } else {
      childIcon = IconButton(
        onPressed: rollDiceFunction,
        icon: const Text(
          "Roll Dice",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      );
    }

    return IconButton(
      onPressed: rollDiceFunction,
      icon: SizedBox(
        width: 200,
        height: 200,
        child: childIcon,
      ),
    );
  }
}
