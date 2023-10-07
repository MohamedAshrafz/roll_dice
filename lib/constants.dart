import 'package:flutter/material.dart';

const double diceIconSize = 240.0;
const appColorGradientList = [
  Color.fromARGB(255, 111, 14, 145),
  Color.fromARGB(255, 152, 67, 219),
  // Color.fromARGB(255, 109, 66, 219),
  // Color.fromARGB(255, 84, 66, 219),
];
const homeScreenColorGradientList = [
  Color.fromARGB(255, 219, 34, 34),
  Color.fromARGB(255, 219, 68, 34),
  Color.fromARGB(255, 219, 105, 34),
];

const appBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: appColorGradientList,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
