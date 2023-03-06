import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: const TextSpan(
                  text: 'Bem vindo, ',
                  style: TextStyle(fontSize: 22),
                  children: <TextSpan>[
                TextSpan(
                    text: 'Sávio!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: ThemeColors.primary,
                    ))
              ])),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
    );
  }
}
