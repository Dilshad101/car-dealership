import 'package:flutter/material.dart';

class AppTextStyles {
  static const small = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle large = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey[700]!,
  );
  static const xLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  static const xxl = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}
