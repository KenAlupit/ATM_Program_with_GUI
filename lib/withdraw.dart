import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Background color for the page
        backgroundColor: const Color.fromRGBO(232, 230, 226, 1),

        // AppBar displaying "Withdraw"
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 109, 47, 1), // Green background color
          foregroundColor: Colors.white,
          elevation: 4,
          title: const Text('ATM APPLICATION'), // Retained title
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              // Open menu logic here
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Open profile logic here
              },
              icon: const Icon(Icons.person),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),

        // Body section
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Section title "Withdraw" at the top
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Withdraw",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(32, 32, 32, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space below the title

              // Displaying available balance
              const Text(
                "Your Available Balance is: 1000000000",
                style: TextStyle(fontSize: 18, color: Color.fromRGBO(32, 32, 32, 1)),
              ),
              const SizedBox(height: 75), // Space below the balance

              // Input field for withdrawal amount
              TextFormField(
                obscureText: false, // Changed to false for amount input
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(1, 109, 47, 1), width: 2), // Green border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(1, 109, 47, 1), width: 1), // Green border when enabled
                  ),
                  labelText: 'Enter amount you wish to withdraw',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50), // Space below the amount input

              // Withdraw button (rounded and styled)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(1, 109, 47, 1), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded rectangle shape
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18), // Taller height
                ),
                onPressed: () {
                  // Withdraw logic here
                },
                child: const Text(
                  "Withdraw",
                  style: TextStyle(color: Colors.white), // White text
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Back button (rounded and styled)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255), // White color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded rectangle shape
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18), // Taller height
                ),
                onPressed: () {
                  // Back button logic here
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.black), // Black text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
