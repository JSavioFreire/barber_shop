import 'package:barber_shop/model/days_worked.dart';
import 'package:flutter/material.dart';

class RowTextEachHour extends StatelessWidget {
  final DayWorkedModel allArg;
  const RowTextEachHour({super.key, required this.allArg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Horário',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                allArg.hours,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Profissional'),
              Text(allArg.proName, style: const TextStyle(fontSize: 25)),
            ],
          )
        ],
      ),
    );
  }
}
