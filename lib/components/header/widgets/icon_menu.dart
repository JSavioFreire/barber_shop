import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final Color color;
  const IconMenu({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: color,
          size: 30,
        ));
  }
}
