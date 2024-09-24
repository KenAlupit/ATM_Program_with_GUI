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
          title: Text('Transfer Money'),
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
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name of the receiver',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter amount you wish to transfer',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Transfer")),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Back"))
              ]),
        ),
      ),
    );
  }
}
