import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/screens/admin/widgets/each_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Administrador'),
        actions: [
          IconButton(
            onPressed: () => (context).read<AuthProvider>().logout(),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            EachOption(
                name: 'Ver Horários Marcados',
                onPressed: () {},
                icon: Icons.watch_later),
            EachOption(
                name: 'Alterar Horários Trabalhados',
                onPressed: () {},
                icon: Icons.watch_outlined),
          ],
        ),
      ),
    );
  }
}
