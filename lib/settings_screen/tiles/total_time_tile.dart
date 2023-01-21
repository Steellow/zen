import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

String getTimeMeditatedAsString(int seconds) {
  int totalMinutes = seconds ~/ 60;
  int hours = totalMinutes ~/ 60;
  int leftoverMinutes = totalMinutes % 60;

  if (seconds < 60) {
    return "$seconds seconds";
  } else if (totalMinutes < 60) {
    return '$totalMinutes minutes';
  } else if (totalMinutes < 600) {
    return '$hours ${hours > 1 ? "hours" : "hour"}${leftoverMinutes > 0 ? ' $leftoverMinutes minutes' : ""}';
  } else {
    return '$hours hours';
  }
}

class TotalTimeTile extends StatelessWidget {
  TotalTimeTile({super.key});

  final int secondsMeditated = Hive.box(BOX_NAME_QUICK_STATS)
      .get(BOX_KEY_TOTAL_SECONDS_MEDITATED, defaultValue: 0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {}, // Empty onTap for that cool ripple effect
      leading: const CenterIcon(icon: Icon(Icons.hourglass_bottom_rounded)),
      title: Text(
        getTimeMeditatedAsString(secondsMeditated),
      ),
      subtitle: const Text("Total time spent chilling"),
    );
  }
}
