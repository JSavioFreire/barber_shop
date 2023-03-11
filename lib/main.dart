import 'package:barber_shop/firebase_options.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/provider/db/appointment/appointment.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/provider/time/time.dart';
import 'package:barber_shop/service/check_is_login.dart';
import 'package:barber_shop/theme/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/db/admin/functions_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Time()),
      ChangeNotifierProvider(create: (context) => FunctionsAdm()),
      ChangeNotifierProvider(
          create: (context) => AuthProvider(context: context)),
      ChangeNotifierProvider(
          create: (context) => FunctionsAuthProvider(context: context)),
      ChangeNotifierProvider(create: (context) => ProfessionalDbProvider()),
      ChangeNotifierProvider(
          create: (context) => AppointmentProvider(context: context)),
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
