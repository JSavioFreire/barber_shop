import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:barber_shop/screens/user/home/components/appointment/widgets/each_hour.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);

    return Drawer(
      backgroundColor: ThemeColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Horários marcados:',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemCount: daysWorked.listHourMarkedUser.length,
                    itemBuilder: (context, index) => EachHour(
                        daysWorked: daysWorked.listHourMarkedUser[index])),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                  authProvider.logout();
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
