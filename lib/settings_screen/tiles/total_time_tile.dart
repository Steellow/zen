import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class TotalTimeTile extends StatelessWidget {
  const TotalTimeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.hourglass_bottom_rounded)),
      title: const Text("279 hours"),
      subtitle: const Text("Total time spent chilling"),
    );
  }
}
