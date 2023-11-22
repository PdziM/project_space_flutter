import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  final BuildContext _context;
  bool isDarkModeOn = false;

  MainState(this._context);
}
