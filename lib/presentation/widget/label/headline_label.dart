import 'package:flutter/material.dart';

class HeadlineLabel extends StatelessWidget {
  final String text;

  const HeadlineLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
