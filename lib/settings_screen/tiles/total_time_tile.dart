import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

class TotalTimeTile extends StatelessWidget {
  const TotalTimeTile({super.key});

  String getTitle(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int leftoverMinutes = totalMinutes % 60;

    if (totalMinutes < 60) {
      return '$totalMinutes minutes';
    } else if (totalMinutes < 600) {
      return '$hours ${hours > 1 ? "hours" : "hour"}${leftoverMinutes > 0 ? ' $leftoverMinutes minutes' : ""}';
    } else {
      return '$hours hours';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(BOX_NAME_QUICK_STATS).listenable(),
      builder: (context, box, widget) {
        return ListTile(
          onTap: () {}, // Empty onTap for that cool ripple effect
          leading: const CenterIcon(icon: Icon(Icons.hourglass_bottom_rounded)),
          title: Text(
            getTitle(
              box.get(BOX_KEY_TOTAL_MINUTES_MEDITATED, defaultValue: 0),
            ),
          ),
          subtitle: const Text("Total time spent chilling"),
        );
      },
    );
  }
}
