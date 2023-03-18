import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/days_worked.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachHour extends StatelessWidget {
  final DayWorkedModel daysWorked;

  const EachHour({super.key, required this.daysWorked});

  @override
  Widget build(BuildContext context) {
    DateTime toDate = DateTime.parse(daysWorked.day);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColors.primary,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              toDate.day == CurrentDate().currentDateHour().day &&
                      toDate.month == CurrentDate().currentDateHour().month &&
                      toDate.year == CurrentDate().currentDateHour().year
                  ? const Text('Hoje', style: TextStyle(fontSize: 11))
                  : toDate.day ==
                              CurrentDate()
                                  .currentDateHour()
                                  .add(const Duration(days: 1))
                                  .day &&
                          toDate.month ==
                              CurrentDate()
                                  .currentDateHour()
                                  .add(const Duration(days: 1))
                                  .month &&
                          toDate.year ==
                              CurrentDate()
                                  .currentDateHour()
                                  .add(const Duration(days: 1))
                                  .year
                      ? const Text('Amanhã', style: TextStyle(fontSize: 11))
                      : Text(CurrentDate().dateWeekDay(toDate.weekday),
                          style: const TextStyle(fontSize: 11)),
              Text(
                '${toDate.day}/${toDate.month}',
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
          Text(
            daysWorked.hours,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            daysWorked.proName,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
