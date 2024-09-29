import 'package:atm_program_with_gui/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TransferBalance());
}

class TransferBalance extends StatelessWidget {
  const TransferBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferBalanceScreen(),
    );
  }
}

class TransferBalanceScreen extends StatefulWidget {
  const TransferBalanceScreen({Key? key}) : super(key: key);

  @override
  _TransferBalanceScreenState createState() => _TransferBalanceScreenState();
}

extension FormatComma on String {
  String get amountValue {
    return replaceAll(',', "");
  }
}

class _TransferBalanceScreenState extends State<TransferBalanceScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _receiverController = TextEditingController();
  int _currentBalance = 0;

  @override
  void initState() {
    super.initState();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentBalance = prefs.getInt('balance') ?? 10000;
    });
  }

  Future<void> _saveBalance(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
  }

  void _transfer() {
    int transferAmount;

    // Check if both fields are empty
    if (_receiverController.text.isEmpty && _amountController.text.isEmpty) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter both receiver name and amount to transfer.',
      ); 
      return;
    }

    // Validate receiver name
    if (_receiverController.text.isEmpty) {
      showPopup(
        context: context,
        title: 'Error',
        message: "Please enter receiver's name.",
      ); 
      return;
    }

    // Validate amount
    if (_amountController.text.isEmpty) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter an amount to transfer.',
      ); 
      return;
    }

    String rawAmount = _amountController.text.amountValue;

    try {
      transferAmount = int.parse(rawAmount);
    } catch (e) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Please enter a valid number.',
      ); 
      return;
    }

    if (transferAmount <= 0) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Amount must be greater than zero.',
      ); 
    } else if (transferAmount > _currentBalance) {
      showPopup(
        context: context,
        title: 'Error',
        message: 'Insufficient funds. Your balance is $_currentBalance.',
      ); 
    } else {
      setState(() {
        _currentBalance -= transferAmount;
        _saveBalance(_currentBalance);
      });
      _amountController.clear();
      _receiverController.clear();
      showPopup(
        context: context,
        title: 'Success',
        message: 'Transfer successful!',
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 230, 226, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 109, 47, 1),
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transfer",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(32, 32, 32, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Your Available Balance is: $_currentBalance",
              style: const TextStyle(fontSize: 18, color: Color.fromRGBO(32, 32, 32, 1)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _receiverController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")), // Only allow letters and spaces
              ],
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter receiver name',
                labelStyle: TextStyle(color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                ThousandsSeparatorInputFormatter(),
              ],
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter amount to transfer',
                labelStyle: TextStyle(color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(1, 109, 47, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              onPressed: _transfer,
              child: const Text(
                "Transfer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                );
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}