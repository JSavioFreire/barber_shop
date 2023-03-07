import 'package:flutter/material.dart';

class EachProfessional extends StatelessWidget {
  final String name;
  final String image;
  const EachProfessional({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: Image.asset(image),
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
