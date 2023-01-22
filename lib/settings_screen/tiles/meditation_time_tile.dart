import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/select_meditation_time_dialog/meditation_time_select_dialog.dart';
import 'package:zen/util/hive_helper.dart';

class MeditationTimeTile extends StatelessWidget {
  const MeditationTimeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(BOX_NAME_MEDITATION_TIME).listenable(),
      builder: (context, box, widget) {
        String minTime = box
            .get(BOX_KEY_MIN_MEDITAION_TIME, defaultValue: 10.0)
            .toStringAsFixed(0);
        String maxTime = box
            .get(BOX_KEY_MAX_MEDITAION_TIME, defaultValue: 20.0)
            .toStringAsFixed(0);

        return ListTile(
          onTap: () => showMeditationTimeSelectDialog(context),
          leading: const CenterIcon(icon: Icon(Icons.timer)),
          title: const Text("Meditation time"),
          subtitle: Text('$minTime minutes - $maxTime minutes'),
        );
      },
    );
  }
}
