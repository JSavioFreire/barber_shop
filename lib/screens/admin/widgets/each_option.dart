import 'package:flutter/material.dart';

class EachOption extends StatelessWidget {
  final String name;
  final dynamic onPressed;
  final IconData icon;

  const EachOption(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          )
        ]),
      ),
    );
  }
}
