import 'package:flutter/material.dart';

import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/splash/splash_view.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/home': (context) => const HomeView(),
  };
}
