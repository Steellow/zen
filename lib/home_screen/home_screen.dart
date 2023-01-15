import 'package:flutter/material.dart';
import 'package:zen_app/home_screen/custom_fab.dart';
import 'package:zen_app/select_meditation_time_dialog/meditation_time_select_dialog.dart';
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
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.timer,
                    color: Colors.white38,
                  ),
                  onPressed: () => showMeditationTimeSelectDialog(context),
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
            Text(
              "Good morning!",
              style: Styles.titleText,
            ),
            Container(height: 6),
            const Text("Meditation from 10 to 20 minutes"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomFAB(),
    );
  }
}
