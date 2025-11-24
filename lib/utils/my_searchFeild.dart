import 'package:flutter/material.dart';

class MySearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback? onClear;

  const MySearchField({super.key, required this.controller, required this.hint, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: onClear,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}