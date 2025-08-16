import 'package:flutter/material.dart';

class Text_Field_Widget extends StatelessWidget {
  late TextEditingController controller;
  late String label;
  late String hint;
  Text_Field_Widget({
    required this.controller,
    required this.label,
    required this.hint,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
