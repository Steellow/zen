import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class MeditationTimeTile extends StatelessWidget {
  const MeditationTimeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.timer)),
      title: const Text("Meditation time"),
      subtitle: const Text("10 minutes - 20 minutes"),
    );
  }
}
