import 'package:atm_program_with_gui/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';
import 'package:flutter/services.dart';

void main() {
  runApp (const WithdrawBalance());
}

class WithdrawBalance extends StatelessWidget {
  const WithdrawBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WithdrawScreen(),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

extension FormatComma on String {
  String get amountValue {
    return replaceAll(',', "");
  }
}

  TextSelection updateCursorPosition(String text) {
    return TextSelection.collapsed(offset: text.length);
  }

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController _amountController = TextEditingController();
  int _currentBalance = 0; // Current balance fetched from SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadBalance(); // Load current balance from SharedPreferences when the widget is initialized
  }

  // Load the balance from SharedPreferences
  Future<void> _loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentBalance = prefs.getInt('balance') ?? 10000; // Default balance is 10000 if not found
    });
  }

  // Save the updated balance to SharedPreferences
  Future<void> _saveBalance(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
  }

  // Withdraw funds and update the balance with validation
    void _withdraw() {
    int withdrawAmount;

    if (_amountController.text.isEmpty) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter an amount.',
      );// Error if no input is provided
      return;
    }

    // Use the amountValue extension to remove commas and get the raw numeric string
    String rawAmount = _amountController.text.amountValue;

    try {
      withdrawAmount = int.parse(rawAmount); // Parse the raw amount (without commas) as an integer
    } catch (e) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter a valid number.',
      ); // Error for non-numeric input
      return;
    }

    if (withdrawAmount <= 0) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Amount must be greater than zero.',
      );
    } else if (withdrawAmount > _currentBalance) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Insufficient funds. Your balance is $_currentBalance.',
      );
    } else {
      // Valid withdrawal
      setState(() {
        _currentBalance -= withdrawAmount; // Deduct the amount from the balance
        _saveBalance(_currentBalance); // Save the updated balance to SharedPreferences
      });
      _amountController.clear(); // Clear the input field
      showPopup(
        context: context,
        title: 'Success',
        message: 'Withdrawal successful!',
      ); // Show success popup
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 230, 226, 1), // Background color
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 109, 47, 1), // Green background color
        foregroundColor: Colors.white,
        elevation: 4,
        title: const Text('ATM APPLICATION'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section title "Withdraw"
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
            Text(
              "Your Available Balance is: $_currentBalance",
              style: const TextStyle(fontSize: 18, color: Color.fromRGBO(32, 32, 32, 1)),
            ),
            const SizedBox(height: 75), // Space below the balance

            // Input field for withdrawal amount
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Restrict input to digits only
                ThousandsSeparatorInputFormatter()
              ],
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
              onPressed: _withdraw, // Call the withdraw method when pressed
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
    );
  }
}