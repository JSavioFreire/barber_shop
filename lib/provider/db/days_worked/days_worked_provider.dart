import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/days_worked.dart';
import 'package:barber_shop/model/professional.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysWorked extends ChangeNotifier {
  BuildContext context;
  FirebaseFirestore db = FirebaseFirestore.instance;
  DaysWorked({required this.context}) {
    seeDayWorkedToDb();
    seeHourWorkedToDb();
  }

  late ProfessionalDbProvider professionalDbProvider =
      Provider.of<ProfessionalDbProvider>(context, listen: false);
  late AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);

  List<DayWorkedModel> listDayWork = [];
  List<DayWorkedModel> listHourWork = [];
  List<DayWorkedModel> listHourMarked = [];
  List<DayWorkedModel> listHourMarkedUser = [];
  bool loading = true;
  String userPhone = '';
  TextEditingController userObs = TextEditingController(text: '');

  void addDayWorkedToDb(DateTime date, ProfessionalModel pro) {
    DayWorkedModel dayWorkedModel = DayWorkedModel(
        day: date.toString(), proName: pro.name, isMarked: false);

    db
        .collection('availableDays')
        .doc('${dayWorkedModel.proName} ${date.day}-${date.month}-${date.year}')
        .set(dayWorkedModel.toMap());

    for (int i = 8; i < 20; i++) {
      DateTime newDateTime = DateTime(date.year, date.month, date.day, i, 0, 0);
      DayWorkedModel dayWorkedModel = DayWorkedModel(
          day: newDateTime.toString(),
          proName: pro.name,
          hours: '$i:00 h',
          isMarked: false);

      db
          .collection('availableHours')
          .doc(
              '${dayWorkedModel.proName} ${date.day}-${date.month}-${date.year} $i:00 h')
          .set(dayWorkedModel.toMap());
    }

    seeDayWorkedToDb();
    seeHourWorkedToDb();
    isMarked(date: date, pro: pro);
  }

  void seeDayWorkedToDb() async {
    loading = true;
    List<DayWorkedModel> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('availableDays').get();

    for (var doc in snapshot.docs) {
      temp.add(DayWorkedModel.fromMap(doc.data()));
      listDayWork = temp;
    }

    loading = false;
    notifyListeners();
  }

  void seeHourWorkedToDb() async {
    loading = true;
    List<DayWorkedModel> temp = [];
    List<DayWorkedModel> tempMarked = [];
    List<DayWorkedModel> tempMarkedUser = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('availableHours').orderBy('day').get();

    for (var doc in snapshot.docs) {
      DateTime date = DateTime.parse(doc.data()['day']);
      if (date.isAfter(CurrentDate().currentDateHour())) {
        if (doc.data()['isMarked'] == false) {
          temp.add(DayWorkedModel.fromMap(doc.data()));
        }
      }
      if (doc.data()['isMarked'] == true &&
              date.isAfter(CurrentDate().currentDateHour()) ||
          date.day == CurrentDate().currentDateHour().day &&
              date.month == CurrentDate().currentDateHour().month &&
              date.year == CurrentDate().currentDateHour().year) {
        tempMarked.add(DayWorkedModel.fromMap(doc.data()));

        if (doc.data()['userEmail'] == authProvider.users!.email) {
          tempMarkedUser.add(DayWorkedModel.fromMap(doc.data()));
        }
      }
      listHourWork = temp;
      listHourMarked = tempMarked;
      listHourMarkedUser = tempMarkedUser;
    }

    loading = false;
    notifyListeners();
  }

  bool isMarked({required date, required pro}) {
    for (int i = 0; i < listDayWork.length; i++) {
      DateTime toDateTime = DateTime.parse(listDayWork[i].day);
      if (toDateTime.day == date.day &&
          toDateTime.month == date.month &&
          listDayWork[i].proName == pro.name) {
        return true;
      }
    }
    return false;
  }

  void markerService(service) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('userInfo').doc(authProvider.users!.email).get();
    userPhone = snapshot['userPhone'];

    DayWorkedModel dayWorkedModel = DayWorkedModel(
        day: service.day,
        proName: service.proName,
        hours: service.hours,
        isMarked: true,
        userName: authProvider.users!.displayName,
        userEmail: authProvider.users!.email,
        userPhone: userPhone,
        userObs: userObs.text);

    DateTime date = DateTime.parse(dayWorkedModel.day);

    db
        .collection('availableHours')
        .doc(
            '${dayWorkedModel.proName} ${date.day}-${date.month}-${date.year} ${service.hours}')
        .set(dayWorkedModel.toMap());

    userObs.text = '';
    seeHourWorkedToDb();
    notifyListeners();
  }
}
