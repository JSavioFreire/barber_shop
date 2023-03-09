import 'package:barber_shop/model/users_info.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminUserProvider extends ChangeNotifier {
  BuildContext context;
  AdminUserProvider({required this.context});
  FirebaseFirestore db = FirebaseFirestore.instance;

  late AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);
  dynamic isAdmin;

  void isAdminToDb() {
    UserInfoModel userInfo = UserInfoModel(isAdmin: false);
    db
        .collection(authProvider.users!.uid)
        .doc('UserInfo')
        .set(userInfo.toMap());
  }

  void isAdminFromDb() async {
    DocumentSnapshot snapshot =
        await db.collection(authProvider.users!.uid).doc('UserInfo').get();
    isAdmin = snapshot['isAdmin'];
    notifyListeners();
  }
}
