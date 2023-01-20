import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

class TimesMeditadetTile extends StatelessWidget {
  const TimesMeditadetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(BOX_NAME_QUICK_STATS).listenable(),
      builder: (context, box, child) {
        return ListTile(
          onTap: () {},
          leading: const CenterIcon(icon: Icon(Icons.remove_red_eye)),
          title: Text(
            '${box.get(BOX_KEY_TOTAL_TIMES_MEDITATED, defaultValue: 0)} sessions',
          ),
          subtitle: const Text("Times you've closed your eyes"),
        );
      },
    );
  }
}
