import 'package:flutter/material.dart';

class LogoBarber extends StatelessWidget {
  const LogoBarber({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(width: 200, child: Image.asset('assets/logo.jpg')),
          ),
        ],
      ),
    );
  }
}
