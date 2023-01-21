import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Text(
        text,
        style: const TextStyle(height: 1.23),
        textAlign: TextAlign.center,
      ),
    );
  }
}
