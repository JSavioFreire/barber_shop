import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/screens/admin/admin_screen.dart';
import 'package:barber_shop/screens/auth/auth_screen.dart';
import 'package:barber_shop/screens/home/home.dart';
import 'package:barber_shop/screens/loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CheckIsLogin extends StatelessWidget {
  const CheckIsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    FunctionsAuthProvider functionsAuthProvider =
        Provider.of<FunctionsAuthProvider>(context);

    if (authProvider.users == null) {
      return const AuthScreen();
    } else if (functionsAuthProvider.isAdmin == null) {
      return const LoadingScreen();
    } else if (functionsAuthProvider.isAdmin == true) {
      return const AdminScreen();
    } else {
      return const HomeScreen();
    }
  }
}
