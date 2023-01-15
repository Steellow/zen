import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/in_progress_screen/confetti_from_top.dart';
import 'package:zen_app/in_progress_screen/countdown_timer.dart';
import 'package:zen_app/in_progress_screen/meditation_timer.dart';
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
                      MeditationTimer(
                        size: circleSize,
                        onComplete: completeMeditation,
                        controller: meditationController,
                        onGoing: onGoing,
                      ),

                      // Countdown timer
                      CountdownTimer(
                        size: circleSize,
                        controller: countdownController,
                        onComplete: startMeditation,
                        onGoing: onGoing,
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
          ConfettiFromTop(confettiController: confettiController),
        ],
      ),
    );
  }
}
