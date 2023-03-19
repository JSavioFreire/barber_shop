import 'package:barber_shop/components/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget inside;
  final Color backgroundColor;
  const MyScaffold({super.key, required this.inside, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      endDrawer: const MyDrawer(),
      body: inside,
    );
  }
}
