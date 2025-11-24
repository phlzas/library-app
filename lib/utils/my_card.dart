import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;

  const MyCard({super.key, required this.child, this.padding = const EdgeInsets.all(12), this.borderRadius = 12, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(padding: padding, child: child),
      elevation: 4,
    );
  }
}