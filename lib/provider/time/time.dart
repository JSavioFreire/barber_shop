import 'package:flutter/material.dart';

class Time extends ChangeNotifier {

  DateTime currentDateHour() {
    DateTime agora = DateTime.now().toUtc().add(const Duration(hours: -3));
    return agora;
  }



}
