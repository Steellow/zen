import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zen_app/intro_screen/description_text.dart';
import 'package:zen_app/util/styles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          rawPages: [
            Column(
              children: [
                Image.asset('assets/intro-page-1.png'),
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
                Image.asset('assets/intro-page-2.png'),
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
                Image.asset('assets/intro-page-3.png'),
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
          onDone: () {
            print("LMAO");
          },
          onSkip: () {
            print("LMAO");
          },
        ),
      ),
    );
  }
}
