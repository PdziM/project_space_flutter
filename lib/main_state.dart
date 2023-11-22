import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  final BuildContext _context;

  MainState(this._context);

  bool darkTheme = false;
  void setTheme() {
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
