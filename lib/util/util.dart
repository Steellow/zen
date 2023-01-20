import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double randomBetween(double min, double max) =>
    Random().nextDouble() * (max - min) + min;

int getCurrentHour() => DateTime.now().hour;

void openUrl(BuildContext context, String rawUrl) async {
  final Uri url = Uri.parse(rawUrl);
  if (await canLaunchUrl(url)) {
    launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Can't open url :/"),
      ),
    );
  }
}
