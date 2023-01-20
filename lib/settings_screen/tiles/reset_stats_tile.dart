import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class ResetStatsTile extends StatelessWidget {
  const ResetStatsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.delete_forever)),
      title: const Text("Delete stats"),
    );
  }
}
