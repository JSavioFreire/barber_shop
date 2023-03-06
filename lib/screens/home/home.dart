import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/screens/home/components/box_primary.dart';
import 'package:barber_shop/screens/home/components/professionals/professionals.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BoxPrimary(),
            ),
            Professionals()
          ],
        ),
      ),
    );
  }
}
