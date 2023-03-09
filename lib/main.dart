import 'package:barber_shop/firebase_options.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/provider/db/admin/admin_user.dart';
import 'package:barber_shop/provider/db/appointment/appointment.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/service/check_is_login.dart';
import 'package:barber_shop/theme/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/db/admin/functions/functions_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(
          create: (context) => AdminUserProvider(context: context)),
      ChangeNotifierProvider(
          create: (context) => FunctionsAuthProvider(context: context)),
      ChangeNotifierProvider(create: (context) => ProfessionalDbProvider()),
      ChangeNotifierProvider(
          create: (context) => AppointmentProvider(context: context)),
      ChangeNotifierProvider(create: (context) => FunctionsAdm()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber',
      theme: myTheme,
      home: const CheckIsLogin(),
    );
  }
}
