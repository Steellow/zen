import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:zen/util/styles.dart';

class MeditationTimer extends StatelessWidget {
  final double size;
  final CountDownController controller;
  final Function()? onComplete;
  final bool onGoing;
  final double time;

  const MeditationTimer({
    super.key,
    required this.size,
    required this.onComplete,
    required this.controller,
    required this.onGoing,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      // Styling
      width: size,
      height: size,
      ringColor: Styles.buttonColor,
      fillColor: Colors.white,
      strokeWidth: 10,
      textStyle: Styles.titleText,
      strokeCap: StrokeCap.round,

      // Function
      controller: controller,
      duration: time.round(),
      autoStart: false,
      isTimerTextShown: onGoing,
      onComplete: onComplete,
    );
  }
}
