import 'package:flutter/material.dart';

class WorkedHours extends StatelessWidget {
  const WorkedHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: const [Text('Hoje')],
        ));
  }
}
