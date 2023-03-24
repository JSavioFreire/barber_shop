import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void mySnackBar(BuildContext context) {
  final snackbar = SnackBar(
    content: Row(
      children: [
        SizedBox(
            width: 70,
            child: LottieBuilder.asset('assets/snack.json', repeat: false)),
        Text('Horário reservado com sucesso!'),
      ],
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
