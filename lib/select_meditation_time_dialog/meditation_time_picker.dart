import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';

class MeditationTimePicker extends StatefulWidget {
  final double value;
  final Function(double) onChanged;
  final String label;

  const MeditationTimePicker(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.label});

  @override
  State<MeditationTimePicker> createState() => _MeditationTimePickerState();
}

class _MeditationTimePickerState extends State<MeditationTimePicker> {
  @override
  Widget build(BuildContext context) {
    return SpinBox(
      min: 1,
      max: 420,
      value: widget.value,
      onChanged: widget.onChanged,

      // Styling
      decoration: InputDecoration(
        labelText: "${widget.label} (minutes)",
        labelStyle: const TextStyle(fontSize: 20),
      ),
      iconColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.focused)
            ? Colors.white
            : Colors.grey,
      ),
    );
  }
}
