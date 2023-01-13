import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/screens/in_progress_screen.dart';
import 'package:zen_app/util/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.timer),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 42,
                right: 42,
                bottom: 42,
                top: 22,
              ),
              child: Image.asset('assets/meditation-girl.png'),
            ),
            const Text(
              "Good morning!", // TODO: Dynamic hello message
              style: Styles.titleText,
            ),
            Container(
              height: 6,
            ),
            const Text(
              "Meditation from 10 to 20 minutes", // TODO: Dynamic text
              style: TextStyle(
                shadows: [Styles.smallTextShadow],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OpenContainer(
        closedBuilder: (BuildContext ctx, VoidCallback openContainer) {
          // Animation doesn't look smooth with FloatingActionButton widget
          return const SizedBox(
            height: 50,
            width: 180,
            child: Center(
              child: Text(
                "START",
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
      ),
    );
  }
}
