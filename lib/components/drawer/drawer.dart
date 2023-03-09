import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                authProvider.logout();
              },
              child: const Text('Sair'))
        ],
      ),
    );
  }
}
