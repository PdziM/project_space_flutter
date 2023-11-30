import 'package:flutter/material.dart';

import '../../presentation/pages/facebook/login_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/splash/splash_page.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    '/home': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
  };
}
