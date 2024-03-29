import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/db/admin/functions_admin.dart';
import 'package:barber_shop/screens/admin/components/markedhour/marked.dart';
import 'package:barber_shop/screens/admin/components/workedhour/worked_hours.dart';
import 'package:barber_shop/screens/admin/widgets/bottom_navigation.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FunctionsAdm functionsAdm = Provider.of<FunctionsAdm>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela de Administrador',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            onPressed: () => (context).read<AuthProvider>().logout(),
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: ThemeColors.background,
      body: functionsAdm.navigationBottomController == 0
          ? const Marked()
          : const WorkedHours(),
      bottomNavigationBar: const MyBottomNavigation(),
    );
  }
}
