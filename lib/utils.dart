// Function to show success popup
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void showPopup({
  required BuildContext context,
  required String title,
  required String message,
  String buttonText = 'OK',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(buttonText),
          ),
        ],
      );
    },
  );
}

// Class to format number with commas
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final formatter = NumberFormat("#,##0"); // Formatter for thousands with commas, no decimals

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue; // If input is empty, return as is
    }

    // Remove commas to get the raw numeric input
    final newText = newValue.text.replaceAll(',', '');

    // Try parsing the input as an integer
    final int? newTextAsNum = int.tryParse(newText);

    if (newTextAsNum == null) {
      return oldValue; // If input is not a valid number, return the old value
    }

    // Format the number with commas for thousands
    final newFormattedText = formatter.format(newTextAsNum);

    return TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length), // Update cursor position
    );
  }
}