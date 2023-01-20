import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

class TimesMeditatedTile extends StatelessWidget {
  TimesMeditatedTile({super.key});

  final String title =
      '${Hive.box(BOX_NAME_QUICK_STATS).get(BOX_KEY_TOTAL_TIMES_MEDITATED, defaultValue: 0)} sessions';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.remove_red_eye)),
      title: Text(title),
      subtitle: const Text("Times you've closed your eyes"),
    );
  }
}
