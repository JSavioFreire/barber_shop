import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachService extends StatelessWidget {
  final String name;
  final String image;

  const EachService({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.primary, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(color: ThemeColors.background),
          ),
          SizedBox(width: 50, child: Image.asset(image)),
        ],
      ),
    );
  }
}
