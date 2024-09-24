import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Check Balance'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Your Available Balance is: 1000000000"),
                const SizedBox(
                  height: 75,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Back"))
              ]),
        ),
      ),
    );
  }
}
