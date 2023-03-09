import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ver',
              style: TextStyle(color: Colors.white),
            ),
            Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_44xvkxqy.json',
                repeat: false)
          ],
        ));
  }
}
