import 'package:barber_shop/model/professional.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfessionalDbProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  ProfessionalDbProvider() {
    proFromDb();
  }

  List listPro = [];
  bool loadingPro = true;

  void proFromDb() async {
    List<ProfessionalModel> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('professionals').get();

    for (var doc in snapshot.docs) {
      temp.add(ProfessionalModel.fromMap(doc.data()));
    }
    listPro = temp;
    loadingPro = false;
    notifyListeners();
  }
}
