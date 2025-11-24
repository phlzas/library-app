import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfeild extends StatefulWidget {
  String lable;
  String hint;
  TextEditingController controller;
  IconData icon;
  String? Function(String?)? validator;

  MyTextfeild({
    super.key,
    required this.lable,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator
  });

  @override
  State<MyTextfeild> createState() => _MyTextfeildState();
}

class _MyTextfeildState extends State<MyTextfeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ,
      autocorrect: true,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        labelText: widget.lable,
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}