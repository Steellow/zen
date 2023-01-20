import 'package:flutter/material.dart';

class PauseButtons extends StatelessWidget {
  final bool paused;
  final Function()? onResume;
  final Function()? onFinish;

  const PauseButtons({
    super.key,
    required this.paused,
    required this.onResume,
    required this.onFinish,
  });

  final Color buttonColor = Colors.white;

  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: paused ? 1 : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton.icon(
            onPressed: paused ? onResume : null,
            icon: Icon(
              Icons.play_arrow_rounded,
              color: buttonColor,
            ),
            label: Text(
              "Resume",
              style: textStyle,
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: buttonColor,
            ),
          ),
          OutlinedButton.icon(
            onPressed: paused ? onFinish : null,
            icon: Icon(
              Icons.stop,
              color: buttonColor,
            ),
            label: Text(
              "Finish",
              style: textStyle,
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
