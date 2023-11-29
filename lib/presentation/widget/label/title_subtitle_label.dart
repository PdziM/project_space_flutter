import 'package:flutter/material.dart';

class TitleSubtitleLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleLabel(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,
            style: textTheme.headlineLarge!.copyWith(fontSize: 33),
            textAlign: TextAlign.left),
        Text(subtitle,
            style: textTheme.titleLarge!.copyWith(fontSize: 23),
            textAlign: TextAlign.left),
      ],
    );
  }
}
