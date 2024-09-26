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

        // AppBar displaying "ATM APPLICATION"
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 109, 47, 1), // Green background color
          foregroundColor: Colors.white,
          elevation: 4,
          title: const Text('ATM APPLICATION'), // Title updated for consistency
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
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display the balance
              const Text(
                "Your Available Balance is: 1,000,000,000",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(32, 32, 32, 1),
                ),
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 100), // Added space between balance and button

              // Back button (rounded and taller, white background, black text)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded rectangle shape
                    side: const BorderSide(color: Colors.black), // Optional: border
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
