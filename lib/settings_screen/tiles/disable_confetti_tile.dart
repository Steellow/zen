import 'package:flutter/material.dart';
import 'package:zen_app/common_widgets/center_icon.dart';

class DisableConfettiTile extends StatefulWidget {
  const DisableConfettiTile({super.key});

  @override
  State<DisableConfettiTile> createState() => _DisableConfettiTileState();
}

class _DisableConfettiTileState extends State<DisableConfettiTile> {
  bool _currentVal = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _currentVal,
      onChanged: (value) {
        setState(() {
          _currentVal = value;
        });
      },
      title: const Text("Confetti"),
      subtitle: const Text("Disable if your potato phone lags"),
      secondary: const CenterIcon(icon: Icon(Icons.abc)),
      // isThreeLine: true,
    );
  }
}
