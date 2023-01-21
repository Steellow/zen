import 'package:flutter/material.dart';

class HomeScreenImage extends StatelessWidget {
  const HomeScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 42,
        right: 42,
        bottom: 42,
        top: 22,
      ),
      child: Image.asset('assets/meditation-girl.png'),
    );
  }
}
