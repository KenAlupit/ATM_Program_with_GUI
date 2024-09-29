import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Log In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _pinController = TextEditingController();
  String _currentPIN = '1234';
  int _counter = 0;
  @override
  // Load the PIN upon opening homepage
  void initState() {
    super.initState();
    _loadPin();
  }

  // Load the PIN
  _loadPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentPIN = (prefs.getString('pin') ?? '1234'); // Default PIN is 1234
    });
  }

  // Validation for logging in the application
  void _login() {
    if (_pinController.text == _currentPIN) {
      // Credentials match, show modal dialog
      _showLoginSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN')),
      );
      _counter++;
    }
    if (_counter >= 3) {
      _showCounterReachedDialog();
    }
  }

  // Function for showing success dialog
  void _showLoginSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Successful'),
          content: const Text('You have successfully logged in!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Close the main screen
                // Navigate to the next screen (HomePage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showCounterReachedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Maximum Number of Tries Reached'),
          content: const Text('Closing the App!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Close the main screen
                SystemNavigator.pop(); //Only works on device emulator
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 230, 226, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 109, 47, 1),
        title: const Text(
          'ATM APPLICATION',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'lib/images/atm_icon.png',
                height: 100,
              ),
              const SizedBox(height: 50),

              // Section title "Log In" at the top
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(32, 32, 32, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // PIN input field with white background
              TextFormField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'PIN',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your PIN';
                  }
                  return null;
                },
              ),
              const SizedBox(
                  height: 30), // Space between input field and button

              // Log In button (rounded and taller)
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(1, 109, 47, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(
                  height: 20), // Space between Log In and Forgot PIN button

              // Forgot PIN button
              TextButton(
                onPressed: () {
                  // Add 'Forgot PIN' functionality here
                },
                child: const Text(
                  'Forgot PIN?',
                  style: TextStyle(color: Color.fromRGBO(1, 109, 47, 1)),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
