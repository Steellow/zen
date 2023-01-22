import 'package:flutter/material.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/util/hive_helper.dart';

class DisableConfettiTile extends StatefulWidget {
  const DisableConfettiTile({super.key});

  @override
  State<DisableConfettiTile> createState() => _DisableConfettiTileState();
}

class _DisableConfettiTileState extends State<DisableConfettiTile> {
  bool _currentVal = isConfettiEnabled();

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _currentVal,
      onChanged: (value) {
        setState(() {
          _currentVal = value;
        });
        setConfettiEnabled(value);
      },
      title: const Text("Confetti"),
      subtitle: const Text("Disable if your potato phone lags"),
      secondary: const CenterIcon(icon: Icon(Icons.abc)),
      // isThreeLine: true,
    );
  }
}
