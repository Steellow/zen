import 'package:flutter/material.dart';
import 'package:zen_app/settings_screen/settings_subtitle.dart';
import 'package:zen_app/settings_screen/tiles/average_length_tile.dart';
import 'package:zen_app/settings_screen/tiles/disable_confetti_tile.dart';
import 'package:zen_app/settings_screen/tiles/meditation_time_tile.dart';
import 'package:zen_app/settings_screen/tiles/times_meditated_tile.dart';
import 'package:zen_app/settings_screen/tiles/total_time_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SettingsSubtitle(text: "Stats"),
          TotalTimeTile(),
          TimesMeditadetTile(),
          AverageLengthTile(),
          SettingsSubtitle(text: "Settings"),
          MeditationTimeTile(),
          DisableConfettiTile(),

          // Reset stats
          // Rate app
          // Source code
        ],
      ),
    );
  }
}