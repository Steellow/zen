import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class AverageLengthTile extends StatelessWidget {
  const AverageLengthTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.alarm_on)),
      title: const Text("12 minutes"),
      subtitle: const Text("Your average meditation length"),
    );
  }
}
