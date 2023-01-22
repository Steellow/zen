import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:zen/util/styles.dart';

class CountdownTimer extends StatelessWidget {
  final double size;
  final CountDownController controller;
  final Function()? onComplete;
  final bool onGoing;

  const CountdownTimer({
    super.key,
    required this.size,
    required this.controller,
    required this.onComplete,
    required this.onGoing,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !onGoing,
      child: CircularCountDownTimer(
        // Styling
        width: size,
        height: size,
        ringColor: Styles.buttonColor,
        fillColor: Colors.red,
        strokeWidth: 10,
        textStyle: Styles.titleText.copyWith(
          color: Colors.red,
        ),
        strokeCap: StrokeCap.round,
        isReverseAnimation: true,

        // Function
        autoStart: true,
        isReverse: true,
        duration: 4,
        controller: controller,
        onComplete: onComplete,
      ),
    );
  }
}
