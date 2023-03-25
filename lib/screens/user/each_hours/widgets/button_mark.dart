import 'package:barber_shop/model/days_worked.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:barber_shop/components/snackbar/my_snackbar.dart';

class ButtonMark extends StatelessWidget {
  final DayWorkedModel allArg;
  const ButtonMark({super.key, required this.allArg});

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
          onPressed: () {
            daysWorked.markerService(allArg);
            Navigator.pop(context);
            mySnackBar(context);
          },
          child: const Text(
            'Reservar horário',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
