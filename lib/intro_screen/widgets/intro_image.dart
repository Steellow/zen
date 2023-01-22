import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  final String image;
  final double padding;

  const IntroImage({super.key, required this.image, required this.padding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Image.asset(image),
      ),
    );
  }
}
