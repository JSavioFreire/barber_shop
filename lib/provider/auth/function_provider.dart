import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FunctionsAuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  bool buttonInLoading = false;
  bool isRegister = false;
  bool iconVisibility = true;
  IconData icon = Icons.visibility_off;
  bool passwordVisibility = true;

  void changeLoginToRegister() {
    isRegister = !isRegister;
    notifyListeners();
  }

  void login(
      {required BuildContext context,
      required TextEditingController email,
      required TextEditingController password}) async {
    buttonInLoading = true;
    notifyListeners();
    try {
      await context.read<AuthProvider>().login(email.text, password.text);
      buttonInLoading = false;
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
      required phone}) async {
    buttonInLoading = true;
    notifyListeners();
    try {
      await context
          .read<AuthProvider>()
          .register(email.text, password.text, name.text, phone.text);
      buttonInLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      buttonInLoading = false;
      notifyListeners();
    }
  }

  void changeVisibility() {
    iconVisibility = !iconVisibility;
    passwordVisibility = !passwordVisibility;
    notifyListeners();
    if (iconVisibility == false) {
      icon = Icons.visibility;
      notifyListeners();
    } else {
      icon = Icons.visibility_off;
      notifyListeners();
    }
  }
}
