import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/days_worked.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

void modalAdmin(
    {required BuildContext context, required DayWorkedModel dayWorked}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      DateTime date = DateTime.parse(dayWorked.day);
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          color: ThemeColors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dayWorked.proName),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      CurrentDate()
                          .todayOrTomorrow(DateTime.parse(dayWorked.day)),
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Text('${date.day} / ${date.month} / ${date.year}'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RichText(
                    text: TextSpan(text: 'Nome do cliente: ', children: [
                  TextSpan(
                      text: dayWorked.userName,
                      style: const TextStyle(fontSize: 20))
                ])),
              ),
              RichText(
                  text: TextSpan(text: 'Telefone do cliente: ', children: [
                TextSpan(
                    text: dayWorked.userPhone,
                    style: const TextStyle(fontSize: 18))
              ])),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RichText(
                    text: TextSpan(text: 'Anotações do cliente: ', children: [
                  TextSpan(
                      text: dayWorked.userObs,
                      style: const TextStyle(fontSize: 18))
                ])),
              ),
              RichText(
                  text: TextSpan(text: 'Email do cliente: ', children: [
                TextSpan(
                  text: dayWorked.userEmail,
                )
              ]))
            ],
          ),
        ),
      );
    },
  );
}
