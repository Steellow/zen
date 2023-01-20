import 'package:flutter/material.dart';

class PressToPauseText extends StatelessWidget {
  final bool visible;

  const PressToPauseText({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1 : 0,
      child: Container(
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
      ),
    );
  }
}
