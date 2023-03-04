import 'package:barber_shop/screens/auth/components/forms/all_form.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:barber_shop/screens/auth/components/logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            LogoBarber(),
            AllForm(),
          ],
        ),
      ),
    );
  }
}
