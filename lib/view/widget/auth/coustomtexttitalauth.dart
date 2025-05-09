import 'package:flutter/material.dart';

class CostuomTextTitalAuth extends StatelessWidget {
  final String text;
  const CostuomTextTitalAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
