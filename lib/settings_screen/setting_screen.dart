import 'package:flutter/material.dart';
import 'package:zen/settings_screen/settings_subtitle.dart';
import 'package:zen/settings_screen/tiles/average_length_tile.dart';
import 'package:zen/settings_screen/tiles/disable_confetti_tile.dart';
import 'package:zen/settings_screen/tiles/meditation_time_tile.dart';
import 'package:zen/settings_screen/tiles/rate_app_tile.dart';
import 'package:zen/settings_screen/tiles/reset_stats_tile.dart';
import 'package:zen/settings_screen/tiles/source_code_tile.dart';
import 'package:zen/settings_screen/tiles/times_meditated_tile.dart';
import 'package:zen/settings_screen/tiles/total_time_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SettingsSubtitle(text: "Stats"),
          TotalTimeTile(),
          TimesMeditatedTile(),
          const AverageLengthTile(),
          //
          const SettingsSubtitle(text: "Settings"),
          const MeditationTimeTile(),
          const DisableConfettiTile(),
          const ResetStatsTile(),
          //
          const SettingsSubtitle(text: "Other"),
          const RateAppTile(),
          const SourceCodeTile(),
        ],
      ),
    );
  }
}
