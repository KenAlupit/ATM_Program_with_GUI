import 'package:flutter/material.dart';
import 'package:atm_program_with_gui/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'menu.dart';

void main() {
  runApp(const Deposit());
}

class Deposit extends StatelessWidget {
  const Deposit({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _DepositScreen(),
    );
  }
}

class _DepositScreen extends StatefulWidget {
  const _DepositScreen({super.key});

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

extension FormatComma on String {
  String get amountValue {
    return replaceAll(',', "");
  }
}

class _DepositScreenState extends State<_DepositScreen>{
  final TextEditingController _depositAmountController = TextEditingController();
  int _currentBalance = 0; 

  @override
  void initState() {
    super.initState();
    _loadBalance(); 
  }

  // Load the balance from SharedPreferences
  Future<void> _loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentBalance = prefs.getInt('balance') ?? 10000;
    });
  }

  // Save the updated balance to SharedPreferences
  Future<void> _saveBalance(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
  }

  void _depositMoney(){
    int _depositAmount;

      if (_depositAmountController.text.isEmpty) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter an amount.',
      );// Error if no input is provided
      return;
    }

    // Use the amountValue extension to remove commas and get the raw numeric string
    String rawAmount = _depositAmountController.text.amountValue;

    try {
      _depositAmount = int.parse(rawAmount); // Parse the raw amount (without commas) as an integer
    } catch (e) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter a valid number.',
      ); // Error for non-numeric input
      return;
    }

    if (_depositAmount <= 0) {
      showPopup(
        context: context,
        title: 'Invalid Amount',
        message: 'Amount must be greater than zero.',
      );
    } else {
      // Valid withdrawal
      setState(() {
        _currentBalance += _depositAmount; // Add amount to current balance
        _saveBalance(_currentBalance); // Save the updated balance to SharedPreferences
      });
      _depositAmountController.clear(); // Clear the input field
      showPopup(
        context: context,
        title: 'Success',
        message: 'Deposit successful!',
      ); // Show success popup
    }

  }

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

              // Displaying available balance
              Text(
                "Your Available Balance is: $_currentBalance",
                style: const TextStyle(fontSize: 18, color: Color.fromRGBO(32, 32, 32, 1)),
              ),
              const SizedBox(height: 75),

              // Deposit input field with white background
              TextFormField(
                controller: _depositAmountController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Restrict input to digits only
                  ThousandsSeparatorInputFormatter()
                ],
                decoration: const InputDecoration(
                  filled: true, // White background
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Enter amount to deposit',
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
                onPressed: _depositMoney, //Call method
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu()),
                );
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
