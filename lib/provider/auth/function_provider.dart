import 'package:barber_shop/model/users_info.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/db/admin/functions_admin.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FunctionsAuthProvider extends ChangeNotifier {
  BuildContext context;
  FunctionsAuthProvider({required this.context});

  late AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
  late FunctionsAdm functionsAdm = Provider.of<FunctionsAdm>(context, listen: false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  bool buttonInLoading = false;
  bool isRegister = false;
  bool iconVisibility = true;

  void changeLoginToRegister() {
    isRegister = !isRegister;
    notifyListeners();
  }

  void login(
      {required BuildContext context,
      required TextEditingController email,
      required TextEditingController password}) async {
    functionsAdm.isAdmin = null;
    buttonInLoading = true;
    notifyListeners();
    try {
      await context.read<AuthProvider>().login(email.text, password.text);
      buttonInLoading = false;
      functionsAdm.checkIsAdmin(email.text);
      notifyListeners();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            e.message,
            style: const TextStyle(color: ThemeColors.background),
          )));
      buttonInLoading = false;
      notifyListeners();
    }
  }

  void register(
      {required BuildContext context,
      required email,
      required password,
      required name,
      required phone,
      required id}) async {
    buttonInLoading = true;
    notifyListeners();
    functionsAdm.isAdmin = null;

    try {
      await context
          .read<AuthProvider>()
          .register(email.text, password.text, name.text);
      buttonInLoading = false;
      functionsAdm.isAdmin = false;

      UserInfoModel userInfo = UserInfoModel(isAdmin: false, userPhone: phone.text);
      await db.collection('userInfo').doc(email.text).set(userInfo.toMap());

      notifyListeners();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      buttonInLoading = false;
      notifyListeners();
    }
  }
}
