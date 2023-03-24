import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marked extends StatelessWidget {
  const Marked({super.key});

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemCount: daysWorked.listHourMarked.length,
        itemBuilder: ((context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Text>[
                    Text(CurrentDate().todayOrTomorrow(
                        DateTime.parse(daysWorked.listHourMarked[index].day))),
                    Text(daysWorked.listHourMarked[index].hours),
                  ],
                ),
                Text(daysWorked.listHourMarked[index].userName.toString())
              ]),
            )),
      ),
    );
  }
}
