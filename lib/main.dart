import 'package:flutter/material.dart';

import 'package:roll_dice/home_page.dart';
import 'constants.dart';

const appBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: appColorGradientList,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreenWidget.defaultAppColoring(title: "Hello There"),
    );
  }
}
