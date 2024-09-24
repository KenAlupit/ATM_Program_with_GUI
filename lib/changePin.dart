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
          title: Text('Change PIN'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Current PIN',
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
                      labelText: 'Enter New PIN',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Change")),
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
