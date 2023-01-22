import 'package:flutter/material.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/util/hive_helper.dart';
import 'package:zen/util/util.dart';

class ResetStatsTile extends StatelessWidget {
  const ResetStatsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showConfirmationDialog(context),
      leading: const CenterIcon(icon: Icon(Icons.delete_forever)),
      title: const Text("Delete stats"),
    );
  }
}

_showConfirmationDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("You sure?"),
        content: const Text("This cannot be undone"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              deleteStats();
              showSnackBar(context, "All stats deleted");
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("OK"),
          ),
        ],
      );
    });
