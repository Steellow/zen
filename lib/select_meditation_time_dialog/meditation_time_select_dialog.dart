import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/select_meditation_time_dialog/meditation_time_picker.dart';
import 'package:zen_app/util/hive_helper.dart';

Future<void> showMeditationTimeSelectDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const _DialogContent();
      });
}

class _DialogContent extends StatefulWidget {
  const _DialogContent();

  @override
  State<_DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<_DialogContent> {
  var box = Hive.box(BOX_NAME_MEDITATION_TIME);

  late double _minValue;
  late double _maxValue;

  @override
  void initState() {
    _minValue = box.get(BOX_KEY_MIN_MEDITAION_TIME, defaultValue: 10.0);
    _maxValue = box.get(BOX_KEY_MAX_MEDITAION_TIME, defaultValue: 20.0);
    super.initState();
  }

  void _minValueChanged(double val) {
    setState(() {
      _minValue = val;
      if (_minValue > _maxValue) {
        _maxValue = val;
      }
    });
  }

  void _maxValueChanged(double val) {
    setState(() {
      _maxValue = val;
      if (_maxValue < _minValue) {
        _minValue = val;
      }
    });
  }

  void _saveValues(BuildContext context) {
    box.put(BOX_KEY_MIN_MEDITAION_TIME, _minValue);
    box.put(BOX_KEY_MAX_MEDITAION_TIME, _maxValue);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Meditation time"),

      // Wrapping content with column keeps dialog size reasonable
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
      ),

      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            _saveValues(context);
          },
        ),
      ],
    );
  }
}
