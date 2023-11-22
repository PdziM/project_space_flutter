import 'package:flutter/material.dart';

class Busy extends StatelessWidget {
  final bool isBusy;
  final Widget child;
  // final T type;

  const Busy({
    super.key,
    required this.isBusy,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => type(context: context),
    //   child: Consumer<type>(builder: (_, state, __) {

    //   },)
    // );
    return isBusy
        ? const Center(
            child: Column(
              children: [
                CircularProgressIndicator.adaptive(),
                SizedBox(height: 3),
                Text('Carregando...'),
              ],
            ),
          )
        : child;
  }
}
