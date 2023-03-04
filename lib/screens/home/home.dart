import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';

import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Column(
        children: [
          Header(),
          ElevatedButton(
              onPressed: () {
                (context).read<AuthProvider>().logout();
              },
              child: Text('sair'))
        ],
      ),
    );
  }
}
