import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Let's go!",
            style: Styles.floatingButtonTextStyle,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
