import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/days_worked.dart';
import 'package:barber_shop/model/professional.dart';
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

  List listDayWork = [];
  List listHourWork = [];
  bool loading = true;

  void addDayWorkedToDb(DateTime date, ProfessionalModel pro) {
    DayWorkedModel dayWorkedModel =
        DayWorkedModel(day: date.toString(), proName: pro.name);

    db
        .collection('availableDays')
        .doc('${dayWorkedModel.proName} ${date.day}-${date.month}-${date.year}')
        .set(dayWorkedModel.toMap());

    for (int i = 8; i < 20; i++) {
      DateTime newDateTime = DateTime(date.year, date.month, date.day, i, 0, 0);
      DayWorkedModel dayWorkedModel = DayWorkedModel(
          day: newDateTime.toString(), proName: pro.name, hours: '$i:00 h');

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
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('availableHours').orderBy('day').get();

    for (var doc in snapshot.docs) {
      DateTime date = DateTime.parse(doc.data()['day']);
      if (date.isAfter(CurrentDate().currentDateHour())) {
        temp.add(DayWorkedModel.fromMap(doc.data()));
        listHourWork = temp;
      }
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
}
