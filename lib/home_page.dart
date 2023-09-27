import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeScreenWidget> {
  int _counter = 0;

  void addOneToTheCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 97, 39, 150),
              Color.fromARGB(255, 148, 66, 169),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You pressed the button",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$_counter",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(150, 21, 189, 26),
                  ),
                ),
                const Text(
                  " times",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addOneToTheCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
