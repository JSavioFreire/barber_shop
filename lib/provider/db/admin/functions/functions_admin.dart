import 'package:flutter/material.dart';

class FunctionsAdm extends ChangeNotifier {
  int navigationBottomController = 0;

  changeNavigationBottomController(int newScreen) {
    navigationBottomController = newScreen;
    notifyListeners();
  }
}
