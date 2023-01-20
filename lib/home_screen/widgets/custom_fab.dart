import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/in_progress_screen/in_progress_screen.dart';
import 'package:zen_app/util/styles.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (BuildContext ctx, VoidCallback openContainer) {
        // Animation doesn't look smooth with FloatingActionButton widget
        return const SizedBox(
          height: 50,
          width: 180,
          child: Center(
            child: Text(
              "MEDITATE",
              style: Styles.floatingButtonTextStyle,
            ),
          ),
        );
      },
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
      ),
      closedColor: Styles.buttonColor,
      openColor: Styles.buttonColor,
      closedElevation: 6,
      openBuilder: (BuildContext ctx, VoidCallback _) {
        return const InProgressScreen();
      },
    );
  }
}
