import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zen_app/home_screen/home_screen.dart';
import 'package:zen_app/intro_screen/widgets/description_text.dart';
import 'package:zen_app/intro_screen/widgets/intro_image.dart';
import 'package:zen_app/util/hive_helper.dart';
import 'package:zen_app/util/styles.dart';

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
            Column(
              children: [
                const IntroImage(
                  image: 'assets/intro-page-1.png',
                  padding: 34,
                ),
                Text(
                  "zen",
                  style: Styles.titleText,
                ),
                const DescriptionText(
                  text:
                      "This is an lightweight and open source meditation app with nothing unecessary.",
                ),
              ],
            ),
            Column(
              children: [
                const IntroImage(
                  image: 'assets/intro-page-2.png',
                  padding: 34,
                ),
                Text(
                  "Random meditation time",
                  style: Styles.titleText,
                ),
                const DescriptionText(
                  text:
                      "You can set minimum and maximum time, and each session your time is picked randomly between those values. This way you have a little variance each time which keeps meditation fresh and fun.",
                ),
              ],
            ),
            Column(
              children: [
                const IntroImage(
                  image: 'assets/intro-page-3.png',
                  padding: 24,
                ),
                Text(
                  "Continue meditation",
                  style: Styles.titleText,
                ),
                const DescriptionText(
                  text:
                      "Unlike your alarm clock, the sound effect when completing a meditation won't keep going until you dismiss it. You can continue your session effortlessy after the beep.",
                ),
              ],
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
