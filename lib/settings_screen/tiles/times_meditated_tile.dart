import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class TimesMeditadetTile extends StatelessWidget {
  const TimesMeditadetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.remove_red_eye)),
      title: const Text("1 395 sessions"),
      subtitle: const Text("Times you've closed your eyes"),
    );
  }
}
