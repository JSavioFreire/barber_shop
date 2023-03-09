import 'package:barber_shop/provider/db/appointment/appointment.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/screens/home/components/appointment/widgets/each_hour.dart';
import 'package:barber_shop/screens/home/components/appointment/widgets/see_more.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    ProfessionalDbProvider proDbProvider =
        Provider.of<ProfessionalDbProvider>(context);
    AppointmentProvider appointmentProvider =
        Provider.of<AppointmentProvider>(context);

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: ThemeColors.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Próximos horário disponíveis',
                    style:
                        TextStyle(color: ThemeColors.background, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_jlMuwc2HNI.json'),
                ),
              ],
            ),
            Expanded(
                child: proDbProvider.loadingPro
                    ? GridView.builder(
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) => Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.primary,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Lottie.asset(
                                    'assets/loading_skeleton.json'),
                              ),
                            )))
                    : appointmentProvider.listAppointment.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Não temos horários disponíveis no momento.',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ThemeColors.background),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Lottie.network(
                                      'https://assets1.lottiefiles.com/packages/lf20_8gwnjakm.json',
                                      repeat: false),
                                ),
                                const Text(
                                  'Tente novamente mais tarde!',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ThemeColors.background),
                                ),
                              ],
                            ),
                          )
                        : GridView.builder(
                            itemCount:
                                appointmentProvider.listAppointment.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) => index == 7
                                ? const SeeMore()
                                : proDbProvider.loadingPro
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: ThemeColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Lottie.asset(
                                              'assets/loading_skeleton.json'),
                                        ),
                                      )
                                    : Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.red,
                                      )),
                          ))
          ],
        ),
      ),
    );
  }
}
