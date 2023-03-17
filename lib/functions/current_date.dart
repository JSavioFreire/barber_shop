class CurrentDate {
  DateTime currentDateHour() {
    DateTime agora = DateTime.now().toUtc().add(const Duration(hours: -3));
    return agora;
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
}
