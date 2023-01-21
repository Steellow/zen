import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/util.dart';

class RateAppTile extends StatelessWidget {
  const RateAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        openUrl(context, "TODO");
      },
      leading: const CenterIcon(icon: Icon(Icons.star)),
      title: const Text("Rate app"),
    );
  }
}