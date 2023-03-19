import 'package:barber_shop/components/footer/footer.dart';
import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/components/header/widgets/icon_menu.dart';
import 'package:barber_shop/components/header/widgets/welcome_header.dart';
import 'package:barber_shop/components/my_scaffold/my_scaffold.dart';
import 'package:barber_shop/screens/user/home/components/appointment/appointment.dart';
import 'package:barber_shop/screens/user/home/components/box/box_primary.dart';
import 'package:barber_shop/screens/user/home/components/professionals/professionals.dart';
import 'package:barber_shop/screens/user/home/components/all_services/services.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: ThemeColors.background,
      inside: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(
                headerLeft: WelcomeHeader(),
                headerRight: IconMenu(
                  color: Colors.white,
                )),
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
              child: Appointment(),
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
