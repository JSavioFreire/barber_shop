import 'package:barber_shop/model/appointment.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachHour extends StatelessWidget {
  final AppointmentModel appointmentModel;

  const EachHour(
      {super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(appointmentModel.day),
          RichText(
            text: TextSpan(
                text: appointmentModel.hour,
                style: const TextStyle(fontSize: 22),
                children: const <TextSpan>[
                  TextSpan(text: 'h', style: TextStyle(fontSize: 18)),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 15, child: Image.asset(appointmentModel.pro.urlImage)),
              Text(
                appointmentModel.pro.name,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
