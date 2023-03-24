import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: GoogleFonts.oswaldTextTheme().apply(
      bodyColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: ThemeColors.primary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey[600],
      selectedItemColor: Colors.grey[300],
    ));
