import 'package:flutter/material.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/util/util.dart';

class RateAppTile extends StatelessWidget {
  const RateAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        openUrl(context,
            "https://play.google.com/store/apps/details?id=labs.ankia.zen");
      },
      leading: const CenterIcon(icon: Icon(Icons.star)),
      title: const Text("Rate app"),
    );
  }
}
