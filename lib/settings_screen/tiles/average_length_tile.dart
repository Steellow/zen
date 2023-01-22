import 'package:flutter/material.dart';
import 'package:zen/common_widgets/center_icon.dart';
import 'package:zen/util/hive_helper.dart';

class AverageLengthTile extends StatelessWidget {
  const AverageLengthTile({super.key});

  String _getTitle() {
    final int secondMeditated = getTotalSecondsMeditated();
    final int timesMeditated = getTotalTimesMeditated();

    final double averageSeconds = secondMeditated / timesMeditated;
    double averageMinutes = (averageSeconds / 60);

    if (averageMinutes.isNaN) {
      averageMinutes = 0.0;
    }

    return '${averageMinutes.toStringAsFixed(0)} minutes';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CenterIcon(icon: Icon(Icons.alarm_on)),
      title: Text(_getTitle()),
      subtitle: const Text("Your average meditation length"),
    );
  }
}
