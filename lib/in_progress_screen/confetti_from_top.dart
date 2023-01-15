import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiFromTop extends StatelessWidget {
  final ConfettiController confettiController;

  const ConfettiFromTop({super.key, required this.confettiController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: confettiController,
        shouldLoop: true,
        canvas: Size.infinite,

        // Styling
        blastDirection: pi / 2, // Top to bottom
        numberOfParticles: 10,
        minBlastForce: 1,
        maxBlastForce: 10,
        gravity: 0.09,
        // emissionFrequency: 0.03,
      ),
    );
  }
}
