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
              Text("MAIN MENU"),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Check Balance"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Withdraw Cash"),
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Deposit Money"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Transfer Money"),
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Pay Bills"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Change PIN"),
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Exit"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
