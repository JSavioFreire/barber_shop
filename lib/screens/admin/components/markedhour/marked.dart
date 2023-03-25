import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:barber_shop/screens/admin/components/modal/modal_admin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Marked extends StatelessWidget {
  const Marked({super.key});

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: daysWorked.listHourMarked.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Lottie.network(
                        'https://assets1.lottiefiles.com/packages/lf20_8gwnjakm.json',
                        repeat: false),
                  ),
                  const Text('Não tem nenhum serviço marcado no momento!')
                ],
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
              itemCount: daysWorked.listHourMarked.length,
              itemBuilder: ((context, index) => InkWell(
                    onTap: () {
                      modalAdmin(
                          context: context,
                          dayWorked: daysWorked.listHourMarked[index]);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: DateTime.parse(daysWorked
                                              .listHourMarked[index].day)
                                          .day ==
                                      CurrentDate().currentDateHour().day &&
                                  DateTime.parse(daysWorked
                                              .listHourMarked[index].day)
                                          .month ==
                                      CurrentDate().currentDateHour().month &&
                                  DateTime.parse(daysWorked
                                              .listHourMarked[index].day)
                                          .year ==
                                      CurrentDate().currentDateHour().year
                              ? DateTime.parse(
                                          daysWorked.listHourMarked[index].day)
                                      .isBefore(CurrentDate().currentDateHour())
                                  ? Colors.blue
                                  : Colors.green
                              : Colors.grey),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Text>[
                                Text(CurrentDate().todayOrTomorrow(
                                    DateTime.parse(
                                        daysWorked.listHourMarked[index].day))),
                                Text(daysWorked.listHourMarked[index].hours),
                              ],
                            ),
                            Text(daysWorked.listHourMarked[index].userName
                                .toString()),
                            Text(daysWorked.listHourMarked[index].userPhone
                                .toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(daysWorked.listHourMarked[index].proName
                                    .toString()),
                                daysWorked.listHourMarked[index].userObs ==
                                            '' ||
                                        daysWorked.listHourMarked[index]
                                                .userObs ==
                                            null
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: 30,
                                        child: LottieBuilder.network(
                                            'https://assets6.lottiefiles.com/packages/lf20_9s5vox93.json'),
                                      )
                              ],
                            )
                          ]),
                    ),
                  )),
            ),
    );
  }
}
