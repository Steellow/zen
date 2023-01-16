import 'package:flutter/material.dart';

// Used in setting tiles
class CenterIcon extends StatelessWidget {
  final Icon icon;

  const CenterIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    // ListTile icons are never centered for some reason, this container (should) fix it
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(left: 6),
      child: icon,
    );
  }
}
