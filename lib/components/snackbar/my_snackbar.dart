import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void mySnackBar(BuildContext context) {
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LottieBuilder.asset(
          'assets/snack.json',
          repeat: false,
          height: 30,
        ),
        const Text('Horário reservado com sucesso!'),
      ],
    ),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
