import 'package:flutter/material.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/util/util.dart';

class SourceCodeTile extends StatelessWidget {
  const SourceCodeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        openUrl(context, 'https://github.com/Steellow/zen');
      },
      leading: const CenterIcon(icon: Icon(Icons.code)),
      title: const Text("Source code"),
    );
  }
}
