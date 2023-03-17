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
  }

  late ProfessionalDbProvider professionalDbProvider =
      Provider.of<ProfessionalDbProvider>(context, listen: false);

  List listDayWork = [];
  bool loading = true;

  void addDayWorkedToDb(DateTime date, ProfessionalModel pro) {
    DayWorkedModel dayWorkedModel =
        DayWorkedModel(day: date.toString(), proName: pro.name);
    db
        .collection('HoursWorked')
        .doc('${dayWorkedModel.proName}${date.day}-${date.month}-${date.year}')
        .set(dayWorkedModel.toMap());
    seeDayWorkedToDb();
    isMarked(date: date, pro: pro);
  }

  void seeDayWorkedToDb() async {
    loading = true;
    List<DayWorkedModel> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('HoursWorked').get();

    for (var doc in snapshot.docs) {
      temp.add(DayWorkedModel.fromMap(doc.data()));
      listDayWork = temp;
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
