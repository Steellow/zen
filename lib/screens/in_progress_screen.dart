import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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

  CountDownController countdownController = CountDownController();
  CountDownController meditationController = CountDownController();

  void startMeditation() {
    setState(() {
      onGoing = true;
      meditationController.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.buttonColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using the same CircularCountDownTimer to count down when meditation starts.
              // No circle is shown here, but it asserts it's the same size & styling.
              // Also keeps everything simple.
              Stack(
                children: [
                  CircularCountDownTimer(
                    // Styling
                    width: circleSize,
                    height: circleSize,
                    ringColor: Styles.buttonColor,
                    fillColor: Colors.white,
                    strokeWidth: 10,
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    strokeCap: StrokeCap.round,

                    // Function
                    controller: meditationController,
                    duration: 50,
                    autoStart: false,
                    isTimerTextShown: onGoing,
                  ),
                  Visibility(
                    visible: !onGoing,
                    child: CircularCountDownTimer(
                      // Styling
                      width: circleSize,
                      height: circleSize,
                      ringColor: Styles.buttonColor,
                      fillColor: Colors.red,
                      strokeWidth: 10,
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
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
              Text(
                'Now power off the screen and chill ${onGoing ? "😌" : "🙂"}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
