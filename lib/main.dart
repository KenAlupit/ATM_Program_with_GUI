import 'package:flutter/material.dart';
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
<<<<<<< HEAD
<<<<<<< Updated upstream
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

=======
  TextEditingController _pinController = TextEditingController();
  String _currentPIN = '1234';

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

>>>>>>> Stashed changes
=======
>>>>>>> layout-design
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
<<<<<<< HEAD
<<<<<<< Updated upstream
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
=======
=======
>>>>>>> layout-design
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
<<<<<<< HEAD
                controller: _pinController,
                keyboardType: TextInputType.number,
=======
>>>>>>> layout-design
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
<<<<<<< HEAD
              const SizedBox(
                  height: 30), // Space between input field and button

              // Log In button (rounded and taller)
              ElevatedButton(
                onPressed: _login,
=======
              const SizedBox(height: 30), // Space between input field and button

              // Log In button (rounded and taller)
              ElevatedButton(
                onPressed: () {
                  // Log In logic here
                },
>>>>>>> layout-design
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
<<<<<<< HEAD
              const SizedBox(
                  height: 20), // Space between Log In and Forgot PIN button
=======
              const SizedBox(height: 20), // Space between Log In and Forgot PIN button
>>>>>>> layout-design

              // Forgot PIN button
              TextButton(
                onPressed: () {
                  // Add 'Forgot PIN' functionality here
                },
                child: const Text(
                  'Forgot PIN?',
<<<<<<< HEAD
                  style: TextStyle(color: Color.fromRGBO(1, 109, 47, 1)),
=======
                  style: TextStyle(color:  Color.fromRGBO(1, 109, 47, 1)),
>>>>>>> layout-design
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
            ],
          ),
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> layout-design
        ),
      ),
    );
  }
}
