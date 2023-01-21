import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Zen",
              body:
                  "This is an lightweight and open source meditation app with nothing unecessary.",
            ),
            PageViewModel(
              title: "Random meditation time",
              body:
                  "You can set minimum and maximum time, and each session your time is picked randomly between those values. This way you have a little variance each time which keeps meditation fresh and fun.",
            ),
            PageViewModel(
                title: "Continue meditation",
                body:
                    "Unlike your alarm clock, the sound effect when completing a meditation won't keep going until you dismiss it. You can continue your session effortlessy after the beep.")
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
