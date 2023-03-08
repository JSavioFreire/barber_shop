import 'package:barber_shop/components/footer/footer.dart';
import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/screens/home/components/box/box_primary.dart';
import 'package:barber_shop/screens/home/components/hour/hour.dart';
import 'package:barber_shop/screens/home/components/professionals/professionals.dart';
import 'package:barber_shop/screens/home/components/all_services/services.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Header(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BoxPrimary(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Professionals(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Hour(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Services(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Footer(),
            )
          ],
        ),
      ),
    );
  }
}
