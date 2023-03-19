import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget headerLeft;
  final Widget headerRight;
  final dynamic headerCenter;

  const Header(
      {super.key,
      required this.headerLeft,
      required this.headerRight,
      this.headerCenter});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: headerCenter == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [headerLeft, headerRight],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [headerLeft, headerCenter, headerRight],
              ));
  }
}
