import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      this.keyboardType});

  final TextEditingController controller;
  final String label;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(label: Text(label), isDense: true));
  }
}
