import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/components/header/widgets/icon_back.dart';
import 'package:barber_shop/components/header/widgets/icon_menu.dart';
import 'package:barber_shop/components/header/widgets/text_header.dart';
import 'package:barber_shop/components/my_scaffold/my_scaffold.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/screens/user/home/components/appointment/widgets/each_hour.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AllHour extends StatelessWidget {
  const AllHour({super.key});

  @override
  Widget build(BuildContext context) {
    ProfessionalDbProvider proDbProvider =
        Provider.of<ProfessionalDbProvider>(context);

    DaysWorked daysWorked = Provider.of<DaysWorked>(context);

    return MyScaffold(
      backgroundColor: ThemeColors.secondary,
      inside: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Header(
                  headerLeft: IconBack(color: ThemeColors.background),
                  headerCenter: TextHeader(
                      text: 'Horários Disponíveis',
                      color: ThemeColors.background),
                  headerRight: IconMenu(color: ThemeColors.background)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: daysWorked.listHourWork.length,
                      itemBuilder: (contexnt, index) => proDbProvider.loadingPro
                          ? Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.primary,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Lottie.asset(
                                    'assets/loading_skeleton.json'),
                              ),
                            )
                          : EachHour(
                              daysWorked: daysWorked.listHourWork[index])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
