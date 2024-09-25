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
          title: Text('ATM'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("MAIN MENU"),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Check Balance'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Widthraw Money'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Deposit Money'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Transfer Money'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Pay Bills'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Change PIN'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 20,
                      child: SizedBox(
                        height: 70, // Specify height here
                        width: 150,
                        child: Center(
                          child: Text('Exit'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
