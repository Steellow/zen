import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen/util/hive_helper.dart';

class MeditationTimeText extends StatelessWidget {
  const MeditationTimeText({super.key});

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

        return Text('Meditation from $minTime to $maxTime minutes');
      },
    );
  }
}
