import 'package:barber_shop/model/professional.dart';

class AppointmentModel {
  String day;
  String hour;
  ProfessionalModel pro;

  AppointmentModel({required this.day, required this.hour, required this.pro});

  AppointmentModel.fromMap(Map<String, dynamic> map)
      : day = map["day"],
        hour = map["hour"],
        pro = map["pro"];

  Map<String, dynamic> toMap() {
    return {"day": day, "hour": hour, "pro": pro};
  }
}
