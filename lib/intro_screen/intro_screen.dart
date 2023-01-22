import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zen/intro_screen/widgets/custom_intro_page.dart';
import 'package:zen/home_screen/home_screen.dart';
import 'package:zen/select_meditation_time_dialog/meditation_time_select_dialog.dart';
import 'package:zen/util/hive_helper.dart';
import 'package:zen/util/util.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  void _navigateToMainScreen(BuildContext context) {
    setFirstLaunch(false);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          animationDuration: 200,
          rawPages: [
            const CustomIntroPage(
              imagePath: "assets/intro-page-1.png",
              imagePadding: 30,
              title: "zen",
              description:
                  "This is a lightweight and open source meditation app with nothing unnecessary.",
            ),
            CustomIntroPage(
              imagePath: "assets/intro-page-2.png",
              imagePadding: 40,
              title: "Random time",
              description:
                  "You can set minimum and maximum time, and each session your time is picked randomly between those values. This way you have a little variance each time which keeps meditation fresh and fun.",
              button: ElevatedButton(
                onPressed: () => showMeditationTimeSelectDialog(context),
                child: const Text("Set times"),
              ),
            ),
            CustomIntroPage(
              imagePath: "assets/intro-page-3.png",
              imagePadding: 20,
              noHorizontalPadding: true,
              title: "Continue meditation",
              description:
                  "Unlike your alarm clock, the sound effect when completing a meditation won't keep going until you dismiss it. You can continue your session effortlessly after the beep.",
              button: ElevatedButton.icon(
                onPressed: () => playSoundEffect(),
                label: const Text("Try it out"),
                icon: const Icon(Icons.notifications_active_outlined),
              ),
            ),
          ],
          showNextButton: true,
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Let's go!"),
          onDone: () => _navigateToMainScreen(context),
          onSkip: () => _navigateToMainScreen(context),
        ),
      ),
    );
  }
}
