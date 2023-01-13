import 'package:flutter/material.dart';
import 'package:zen_app/util/styles.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.buttonColor,
      body: Center(
        child: Text("Hello!"),
      ),
    );
  }
}
