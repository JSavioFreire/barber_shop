import 'package:barber_shop/firebase_options.dart';
import 'package:barber_shop/provider/auth/auth_provider.dart';
import 'package:barber_shop/provider/auth/function_provider.dart';
import 'package:barber_shop/service/check_is_login.dart';
import 'package:barber_shop/theme/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => FunctionsAuthProvider())
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
