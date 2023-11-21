import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer<HomeState>(
        builder: (context, value, child) {
          return Scaffold(
            body: Center(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text('Get Astronomy Picture of the Day'),
            )),
          );
        },
      ),
    );
  }
}
