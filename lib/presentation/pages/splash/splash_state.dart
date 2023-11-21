import 'package:flutter/material.dart';

class SplashState with ChangeNotifier {
  final BuildContext context;
  double containerHei = 200;

  SplashState({
    required this.context,
  }) {
    init();
  }

  void init() {
    changeSize();
  }

  void changeSize() async {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      containerHei = 250;
      notifyListeners();
    });
  }

  void goHome() {
    Navigator.pushNamed(context, '/home');
  }
}
