import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final Color color;
  const TextHeader({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18),
    );
  }
}
