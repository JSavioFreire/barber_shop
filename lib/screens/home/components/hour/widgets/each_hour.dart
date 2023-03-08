import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachHour extends StatelessWidget {
  final String day;
  final String hour;
  const EachHour({super.key, required this.day, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ThemeColors.primary,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day),
          RichText(
            text: TextSpan(
                text: hour,
                style: const TextStyle(fontSize: 25),
                children: const <TextSpan>[
                  TextSpan(text: 'h', style: TextStyle(fontSize: 18))
                ]),
          )
        ],
      ),
    );
  }
}
