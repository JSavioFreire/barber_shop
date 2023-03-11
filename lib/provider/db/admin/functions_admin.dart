import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FunctionsAdm extends ChangeNotifier {
  int navigationBottomController = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  dynamic isAdmin;

  changeNavigationBottomController(int newScreen) {
    navigationBottomController = newScreen;
    notifyListeners();
  }

  void checkIsAdmin(email) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('userInfo').doc(email).get();

    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null &&
          data.containsKey('isAdmin') &&
          data['isAdmin'] == true) {
        isAdmin = data['isAdmin'];
      } else {
        isAdmin = false;
      }
    }
    notifyListeners();
  }
}
