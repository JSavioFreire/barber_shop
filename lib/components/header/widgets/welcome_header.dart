import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    
    return 
     RichText(
              text: TextSpan(
                  text: 'Bem vindo, ',
                  style: const TextStyle(fontSize: 22),
                  children: <TextSpan>[
                TextSpan(
                    text: authProvider.users!.displayName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: ThemeColors.primary,
                    ))
              ]));
  }
}