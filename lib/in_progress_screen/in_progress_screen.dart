import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/util/styles.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  final double circleSize = 150;

  int countdownBeforeMeditation = DateTime.now().millisecondsSinceEpoch + 4000;

  bool onGoing = false;
  bool complete = false;

  CountDownController countdownController = CountDownController();
  CountDownController meditationController = CountDownController();

  late ConfettiController confettiController;

  @override
  void initState() {
    confettiController = ConfettiController(
      duration: const Duration(minutes: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  void startMeditation() {
    setState(() {
      onGoing = true;
      meditationController.start();
    });
  }

  void completeMeditation() {
    setState(() {
      complete = true;
      confettiController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.buttonColor,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Using the same CircularCountDownTimer to count down when meditation starts.
                  // No circle is shown here, but it asserts it's the same size & styling.
                  // Also keeps everything simple.
                  Stack(
                    children: [
                      // Meditation timer
                      CircularCountDownTimer(
                        // Styling
                        width: circleSize,
                        height: circleSize,
                        ringColor: Styles.buttonColor,
                        fillColor: Colors.white,
                        strokeWidth: 10,
                        textStyle: Styles.titleText,
                        strokeCap: StrokeCap.round,

                        // Function
                        controller: meditationController,
                        duration: 3,
                        autoStart: false,
                        isTimerTextShown: onGoing,
                        onComplete: completeMeditation,
                      ),

                      // Countdown timer
                      Visibility(
                        visible: !onGoing,
                        child: CircularCountDownTimer(
                          // Styling
                          width: circleSize,
                          height: circleSize,
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
                          controller: countdownController,
                          onComplete: startMeditation,
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      complete
                          ? "Great job! 🥳\nYou can continue meditating if you feel like it."
                          : 'Now power off the screen and chill ${onGoing ? "😌" : "🙂"}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
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
          ),
        ],
      ),
    );
  }
}
