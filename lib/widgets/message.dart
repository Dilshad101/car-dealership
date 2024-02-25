import 'package:flutter/material.dart';

class AppMessenger {
  static showMessage(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: isError ? Colors.red : Colors.green,
          content: Text(message)),
    );
  }
}
