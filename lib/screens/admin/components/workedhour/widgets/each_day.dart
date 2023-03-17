import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/professional.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EachDay extends StatelessWidget {
  final DateTime date;
  final ProfessionalModel pro;

  const EachDay({
    super.key,
    required this.date,
    required this.pro,
  });

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);
    return InkWell(
      onTap: () {
        daysWorked.addDayWorkedToDb(date, pro);
      },
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: Colors.grey[100]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${date.day}/${date.month}',
                style: const TextStyle(color: Colors.black),
              ),
              daysWorked.isMarked(date: date, pro: pro)
                  ? const Icon(
                      Icons.verified,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.watch_later_outlined,
                      color: Colors.yellow[900],
                    ),
              Text(CurrentDate().dateWeekDay(date.weekday),
                  style: const TextStyle(color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
