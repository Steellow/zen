import 'package:flutter/material.dart';
import 'package:zen_app/home_screen/hello_text.dart';
import 'package:zen_app/home_screen/widgets/custom_fab.dart';
import 'package:zen_app/home_screen/widgets/home_screen_image.dart';
import 'package:zen_app/home_screen/widgets/meditation_time_text.dart';
import 'package:zen_app/select_meditation_time_dialog/meditation_time_select_dialog.dart';
import 'package:zen_app/settings_screen/setting_screen.dart';
import 'package:zen_app/util/slide_from_left_route.dart';

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
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white38,
                  ),
                  onPressed: () => Navigator.of(context)
                      .push(slideFromLeftRoute(const SettingsScreen())),
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
            const HomeScreenImage(),
            const HelloText(),
            Container(height: 6),
            const MeditationTimeText(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomFAB(),
    );
  }
}
