import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  final BuildContext _context;

  bool _isLogged = false;
  bool get isLogged => _isLogged;

  LoginState(this._context);
}
