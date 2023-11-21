import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashState(context: context),
      child: Consumer<SplashState>(
        builder: (_, state, __) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    height: state.containerHei,
                    duration: const Duration(
                      milliseconds: 2700,
                    ),
                    curve: Curves.ease,
                    onEnd: state.goHome,
                    child: Hero(
                      tag: 'LOGO',
                      child: SvgPicture.asset('assets/nasa_logo.svg'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
