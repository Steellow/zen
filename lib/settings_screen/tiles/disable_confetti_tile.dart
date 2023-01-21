import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/common_widgets/center_icon.dart';
import 'package:zen_app/util/hive_helper.dart';

class DisableConfettiTile extends StatefulWidget {
  const DisableConfettiTile({super.key});

  @override
  State<DisableConfettiTile> createState() => _DisableConfettiTileState();
}

class _DisableConfettiTileState extends State<DisableConfettiTile> {
  final Box box = Hive.box(BOX_NAME_SETTINGS);
  bool _currentVal = true;

  @override
  void initState() {
    _currentVal = box.get(BOX_KEY_CONFETTI_ENABLED, defaultValue: true);
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
        box.put(BOX_KEY_CONFETTI_ENABLED, value);
      },
      title: const Text("Confetti"),
      subtitle: const Text("Disable if your potato phone lags"),
      secondary: const CenterIcon(icon: Icon(Icons.abc)),
      // isThreeLine: true,
    );
  }
}
