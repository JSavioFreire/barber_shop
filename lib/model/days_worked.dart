class DayWorkedModel {
  String day;
  String proName;
  dynamic hours;
  bool isMarked;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? userObs;

  DayWorkedModel(
      {required this.day,
      required this.proName,
      this.hours,
      required this.isMarked,
      this.userName,
      this.userPhone,
      this.userEmail,
      this.userObs});

  DayWorkedModel.fromMap(Map<String, dynamic> map)
      : day = map["day"],
        proName = map["proName"],
        hours = map["hours"],
        isMarked = map["isMarked"],
        userName = map["userName"],
        userPhone = map["userPhone"],
        userEmail = map["userEmail"],
        userObs = map["userObs"];

  Map<String, dynamic> toMap() {
    return {
      "day": day,
      "proName": proName,
      "hours": hours,
      "isMarked": isMarked,
      "userName": userName,
      "userPhone": userPhone,
      "userEmail": userEmail,
      "userObs": userObs
    };
  }
}
