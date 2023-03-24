import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/days_worked.dart';
import 'package:flutter/material.dart';

class EachHour extends StatelessWidget {
  final DayWorkedModel daysWorked;

  const EachHour({super.key, required this.daysWorked});

  @override
  Widget build(BuildContext context) {
    DateTime toDate = DateTime.parse(daysWorked.day);
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/eachhours',
            arguments: {'daysWorked': daysWorked, 'toDate': toDate});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                CurrentDate().todayOrTomorrow(toDate),
                style: const TextStyle(fontSize: 11, color: Colors.white),
              ),
              Text(
                '${toDate.day}/${toDate.month}',
                style: const TextStyle(fontSize: 11, color: Colors.white),
              ),
            ],
          ),
          Text(
            daysWorked.hours,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            daysWorked.proName,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}
