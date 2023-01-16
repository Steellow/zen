import 'package:flutter/material.dart';
import 'package:zen_app/util/styles.dart';

class SettingsSubtitle extends StatelessWidget {
  final String text;

  const SettingsSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 0, 12),
      child: Text(
        text.toUpperCase(),
        style: Styles.settingsSubtitle,
      ),
    );
  }
}
