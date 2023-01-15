import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';

Future<void> showMeditationTimeSelectDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Meditation time"),

          // Wrapping content with column keeps dialog size reasonable
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              MeditationTimeDialogContent(),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      });
}

class MeditationTimeDialogContent extends StatefulWidget {
  const MeditationTimeDialogContent({super.key});

  @override
  State<MeditationTimeDialogContent> createState() =>
      _MeditationTimeDialogContentState();
}

class _MeditationTimeDialogContentState
    extends State<MeditationTimeDialogContent> {
  double _minValue = 10;
  double _maxValue = 20;

  void _minValueChanged(double val) {
    setState(() {
      _minValue = val;
    });
    // Remember to convert to in when saving
  }

  void _maxValueChanged(double val) {
    setState(() {
      _maxValue = val;
    });
    // Remember to convert to in when saving
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MeditationTimePicker(
          value: _minValue,
          onChanged: _minValueChanged,
          label: "Minimum time",
        ),
        Container(height: 40),
        MeditationTimePicker(
          value: _maxValue,
          onChanged: _maxValueChanged,
          label: "Maximum time",
        ),
      ],
    );
  }
}

class MeditationTimePicker extends StatefulWidget {
  double value;
  Function(double) onChanged;
  final String label;

  MeditationTimePicker(
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
        labelText: widget.label,
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
