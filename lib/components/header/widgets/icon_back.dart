import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  final Color color;
  const IconBack({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: color,
        ));
  }
}
