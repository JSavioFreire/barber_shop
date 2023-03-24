class CurrentDate {
  DateTime currentDateHour() {
    DateTime date = DateTime.now().toUtc().add(const Duration(hours: -3));
    DateTime newDateTime =
        DateTime(date.year, date.month, date.day, date.hour, 0, 0);
    return newDateTime;
  }

  String dateWeekDay(int day) {
    if (day == 1) {
      return 'Segunda';
    } else if (day == 2) {
      return 'Terça';
    } else if (day == 3) {
      return 'Quarta';
    } else if (day == 4) {
      return 'Quinta';
    } else if (day == 5) {
      return 'Sexta';
    } else if (day == 6) {
      return 'Sabado';
    } else if (day == 7) {
      return 'Domingo';
    } else {
      return '';
    }
  }

  String todayOrTomorrow(DateTime day) {
    if (day.day == currentDateHour().day &&
        day.month == currentDateHour().month &&
        day.year == currentDateHour().year) {
      return 'Hoje';
    } else if (day.day == currentDateHour().add(const Duration(days: 1)).day &&
        day.month == currentDateHour().add(const Duration(days: 1)).month &&
        day.year == currentDateHour().add(const Duration(days: 1)).year) {
      return 'Amanhã';
    } else {
      return dateWeekDay(day.weekday);
    }
  }
}
