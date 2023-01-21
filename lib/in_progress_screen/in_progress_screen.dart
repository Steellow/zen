import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/in_progress_screen/widgets/confetti_from_top.dart';
import 'package:zen_app/in_progress_screen/widgets/countdown_timer.dart';
import 'package:zen_app/in_progress_screen/widgets/meditation_timer.dart';
import 'package:zen_app/in_progress_screen/widgets/pause_buttons.dart';
import 'package:zen_app/in_progress_screen/widgets/press_to_pause_text.dart';
import 'package:zen_app/in_progress_screen/widgets/state_text.dart';
import 'package:zen_app/util/hive_helper.dart';
import 'package:zen_app/util/styles.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  // Settings
  final double circleSize = 150;
  final double pauseButtonsHeight = 30;
  final bool confettiEnabled = isConfettiEnabled();

  int countdownBeforeMeditation = DateTime.now().millisecondsSinceEpoch + 4000;
  late double meditationTime;

  // State
  bool hasStarted = false;
  bool complete = false;
  bool paused = false;

  // Controllers
  CountDownController countdownController = CountDownController();
  CountDownController meditationController = CountDownController();
  late ConfettiController confettiController;

  @override
  void initState() {
    meditationTime = getMeditationTimeInSeconds();
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
      hasStarted = true;
      meditationController.start();
    });
  }

  void completeMeditation() {
    setState(() {
      complete = true;
      if (confettiEnabled) {
        confettiController.play();
      }
    });
    playSoundEffect();

    String? secondsMeditated = meditationController.getTime();
    if (secondsMeditated == null || int.parse(secondsMeditated) < 60) {
      print("Meditated under 60 seconds, not registering meditation");
    } else {
      addMeditation(int.parse(secondsMeditated));
    }
  }

  void resumeMeditation() {
    setState(() {
      paused = false;
      meditationController.resume();
    });
  }

  // Manually finish before time completes!
  void finishMeditation() {
    paused = false;
    completeMeditation();
  }

  void playSoundEffect() =>
      AudioPlayer().play(AssetSource("sound-effect.wav"), volume: 1);

  Future<bool> onWillPop() {
    if (paused || !hasStarted || complete) {
      return Future<bool>.value(true);
    }

    setState(() {
      paused = true;
      meditationController.pause();
    });

    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Styles.buttonColor,
        body: Stack(
          children: [
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Empty container to make alignment work
                    Container(height: 1),

                    // Container with same height as pause buttons
                    SizedBox(height: pauseButtonsHeight),

                    // Main content of the screen
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            // Meditation timer
                            MeditationTimer(
                              size: circleSize,
                              onComplete: completeMeditation,
                              controller: meditationController,
                              onGoing: hasStarted,
                              time: meditationTime,
                            ),

                            // Using the same CircularCountDownTimer to count down when meditation starts.
                            // No circle is shown here, but it asserts it's the same size & styling.
                            // Also keeps everything simple.

                            // Countdown timer
                            CountdownTimer(
                              size: circleSize,
                              controller: countdownController,
                              onComplete: startMeditation,
                              onGoing: hasStarted,
                            ),
                          ],
                        ),
                        Container(height: 20),
                        StateText(complete: complete, onGoing: hasStarted),
                      ],
                    ),

                    SizedBox(
                      height: pauseButtonsHeight,
                      child: PauseButtons(
                        paused: paused,
                        onResume: resumeMeditation,
                        onFinish: finishMeditation,
                      ),
                    ),

                    PressToPauseText(
                      visible: hasStarted && !complete,
                    ),
                  ],
                ),
              ),
            ),
            ConfettiFromTop(confettiController: confettiController),
          ],
        ),
      ),
    );
  }
}
