class DayWorkedModel {
  String day;
  String proName;
  dynamic hours;

  DayWorkedModel(
      {required this.day, required this.proName, this.hours});

  DayWorkedModel.fromMap(Map<String, dynamic> map)
      : day = map["day"],
        proName = map["proName"],
        hours = map["hours"];

  Map<String, dynamic> toMap() {
    return {"day": day, "proName": proName, "hours": hours};
  }
}
