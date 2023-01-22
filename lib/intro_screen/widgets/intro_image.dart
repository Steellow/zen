import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  final String image;
  final bool noHorizontalPadding;
  final double padding;

  const IntroImage(
      {super.key,
      required this.image,
      required this.padding,
      this.noHorizontalPadding = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: noHorizontalPadding
            ? EdgeInsets.symmetric(vertical: padding)
            : EdgeInsets.all(padding),
        child: Image.asset(image),
      ),
    );
  }
}
