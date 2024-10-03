import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';

void main() {
  runApp(const ChangePIN());
}

class ChangePIN extends StatefulWidget {
  const ChangePIN({super.key});
  @override
  State<ChangePIN> createState() => _ChangePINState();
}

class _ChangePINState extends State<ChangePIN> {
  final TextEditingController _oldPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();
  String? errorMessage; // Default PIN

  @override
  void initState() {
    super.initState();
  }

  _changePin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentPin = '1234';
    // Retrieve the current PIN from SharedPreferences
    setState(() {
      currentPin = prefs.getString('pin') ?? '1234';
    });

    // Check if the current PIN matches with the text in the textfield
    if (currentPin == _newPinController.text) {
      _showErrorDialog();
      setState(() {
        errorMessage = "New PIN cannot be the same as Old PIN.";
      });
    } else if (_oldPinController.text == currentPin) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('pin', _newPinController.text);
      _showSuccessDialog();
    } else {
      _showErrorDialog();
      setState(() {
        errorMessage = "Old PIN is incorrect.";
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Your PIN has been changed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Close the change pin screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                ); // Go back to the main menu
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('$errorMessage'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Background color for the page
        backgroundColor: const Color.fromRGBO(232, 230, 226, 1),

        // AppBar displaying "ATM APPLICATION"
        appBar: AppBar(
          backgroundColor:
              const Color.fromRGBO(1, 109, 47, 1), // Green background color
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
              // Section title "Change PIN" at the top
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Change PIN",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(32, 32, 32, 1),
                  ),
                ),
              ),
              const SizedBox(height: 100), // Added space below the title

              // Current PIN input field with white background
              TextFormField(
                controller: _oldPinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true, // White background
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(1, 109, 47, 1),
                        width: 2), // Green border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(1, 109, 47, 1),
                        width: 1), // Green border when enabled
                  ),
                  labelText: 'Enter Current PIN',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 20, // Adjusted space between input fields
              ),

              // New PIN input field with white background
              TextFormField(
                controller: _newPinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true, // White background
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(1, 109, 47, 1),
                        width: 2), // Green border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(1, 109, 47, 1),
                        width: 1), // Green border when enabled
                  ),
                  labelText: 'Enter New PIN',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 60, // Increased space before buttons
              ),

              // Change PIN button (rounded and taller)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromRGBO(1, 109, 47, 1), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Rounded rectangle shape
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18), // Taller height
                ),
                onPressed: _changePin,
                child: const Text(
                  "Change",
                  style: TextStyle(color: Colors.white), // White text
                ),
              ),
              const SizedBox(
                height: 20, // Space between buttons
              ),

              // Back button (rounded and taller)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 255, 255, 255), // White color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Rounded rectangle shape
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18), // Taller height
                ),
                onPressed: () {
                  Navigator.pop(context); //Close the change pin screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu()),
                  );
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
