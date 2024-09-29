import 'package:flutter/material.dart';
import 'package:atm_program_with_gui/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';

void main() {
  runApp(const Deposit());
}

class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(232, 230, 226, 1),

        // AppBar displaying "ATM APPLICATION"
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
              // Section title "Deposit Money" at the top
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deposit Money",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(32, 32, 32, 1),
                  ),
                ),
              ),
              const SizedBox(height: 100), // Added space below the title

              // Deposit input field with white background
              TextFormField(
                decoration: const InputDecoration(
                  filled: true, // White background
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Enter amount',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 50, // Space below the input field
              ),

              // Deposit button (rounded and taller)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(1, 109, 47, 1), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded rectangle shape
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18), // Taller height
                ),
                onPressed: () {
                  // Deposit logic here
                },
                child: const Text(
                  "Deposit",
                  style: TextStyle(color: Colors.white), // White text
                ),
              ),
              const SizedBox(
                height: 20, // Space between buttons
              ),

              // Back button (rounded and taller)
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
