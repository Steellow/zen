import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class SourceCodeTile extends StatelessWidget {
  const SourceCodeTile({super.key});

  _launchURL(BuildContext context) async {
    final Uri url = Uri.parse('https://github.com/Steellow/zen_app');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Can't open url :/"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _launchURL(context);
      },
      leading: const CenterIcon(icon: Icon(Icons.code)),
      title: const Text("Source code"),
    );
  }
}
