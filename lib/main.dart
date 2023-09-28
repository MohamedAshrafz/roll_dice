import 'package:flutter/material.dart';

import 'package:roll_dice/home_page.dart';

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
      home: const HomeScreenWidget(
        title: "Hi there",
        colorGradientList: [
          Color.fromARGB(255, 84, 66, 219),
          Color.fromARGB(255, 127, 66, 219),
          Color.fromARGB(255, 163, 34, 219),
        ],
      ),
    );
  }
}
