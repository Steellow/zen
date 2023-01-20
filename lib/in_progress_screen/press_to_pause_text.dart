import 'package:flutter/material.dart';

class PressToPauseText extends StatelessWidget {
  const PressToPauseText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: const Text(
        "PRESS BACK TO PAUSE",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          shadows: [],
          color: Colors.white38,
        ),
      ),
    );
  }
}
