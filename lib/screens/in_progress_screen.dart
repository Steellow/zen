import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/util/styles.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

  final double circleSize = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.buttonColor,
      body: Center(
        child: CircularCountDownTimer(
          width: circleSize,
          height: circleSize,
          initialDuration: -3,
          duration: 50,
          ringColor: Styles.buttonColor,
          fillColor: Colors.white,
          strokeWidth: 10,
          textStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
