import 'package:barber_shop/provider/db/admin/functions_admin.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    FunctionsAdm functionsAdm = Provider.of<FunctionsAdm>(context);

    return BottomNavigationBar(
      backgroundColor: ThemeColors.background,
      onTap: (value) => functionsAdm.changeNavigationBottomController(value),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_later_outlined),
          label: 'Serviços Marcados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history_outlined),
          label: 'Alterar Dias Trabalhadas',
        )
      ],
      currentIndex: functionsAdm.navigationBottomController,
    );
  }
}
