import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widget/buttons/custom_button.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginState(context),
      child: Consumer<LoginState>(
        builder: (_, state, __) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  onPressed: () {},
                  showRadius: true,
                  title: 'Login Facebook',
                  iconData: FontAwesomeIcons.facebook,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
