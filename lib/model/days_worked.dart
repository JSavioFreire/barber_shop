
class DayWorkedModel {
  String day;
  String proName;

  DayWorkedModel({required this.day, required this.proName});

  DayWorkedModel.fromMap(Map<String, dynamic> map)
      : day = map["day"],
        proName = map["proName"];

  Map<String, dynamic> toMap() {
    return {"day": day, "proName": proName};
  }
}
