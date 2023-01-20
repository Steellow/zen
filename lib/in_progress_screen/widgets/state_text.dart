import 'package:flutter/material.dart';

class StateText extends StatelessWidget {
  final bool complete;
  final bool onGoing;

  const StateText({super.key, required this.complete, required this.onGoing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        complete
            ? "Great job! 🥳\nYou can continue meditating if you feel like it."
            : 'Now power off the screen and chill ${onGoing ? "😌" : "🙂"}',
        textAlign: TextAlign.center,
      ),
    );
  }
}
