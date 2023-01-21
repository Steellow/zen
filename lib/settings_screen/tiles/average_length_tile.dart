import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

class AverageLengthTile extends StatelessWidget {
  const AverageLengthTile({super.key});

  String _getTitle() {
    final Box box = Hive.box(BOX_NAME_QUICK_STATS);

    final int secondMeditated =
        box.get(BOX_KEY_TOTAL_SECONDS_MEDITATED, defaultValue: 0);
    final int timesMeditated =
        box.get(BOX_KEY_TOTAL_TIMES_MEDITATED, defaultValue: 0);

    final double averageSeconds = secondMeditated / timesMeditated;
    double averageMinutes = (averageSeconds / 60);

    if (averageMinutes.isNaN) {
      averageMinutes = 0.0;
    }

    return '${averageMinutes.toStringAsFixed(0)} minutes';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.alarm_on)),
      title: Text(_getTitle()),
      subtitle: const Text("Your average meditation length"),
    );
  }
}
