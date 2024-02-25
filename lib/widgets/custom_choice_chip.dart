import 'package:flutter/material.dart';

class CustomChoiceChips extends StatelessWidget {
  const CustomChoiceChips({
    super.key,
    required this.item,
    required this.selected,
  });

  final String item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: selected ? Colors.black : Colors.grey.shade300),
        child: Text(
          item,
          style: TextStyle(
              fontSize: 12, color: selected ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
