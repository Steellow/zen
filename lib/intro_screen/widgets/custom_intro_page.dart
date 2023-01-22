import 'package:flutter/material.dart';
import 'package:zen/intro_screen/widgets/description_text.dart';
import 'package:zen/intro_screen/widgets/intro_image.dart';
import 'package:zen/util/styles.dart';

class CustomIntroPage extends StatelessWidget {
  final String imagePath;
  final double imagePadding;
  final bool noHorizontalPadding;
  final String title;
  final String description;
  final Widget? button;

  const CustomIntroPage(
      {super.key,
      required this.imagePath,
      required this.imagePadding,
      this.noHorizontalPadding = false,
      required this.title,
      required this.description,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroImage(
          image: imagePath,
          padding: imagePadding,
          noHorizontalPadding: noHorizontalPadding,
        ),
        Text(
          title,
          style: Styles.titleText,
        ),
        DescriptionText(text: description),
        button != null
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    button!,
                    Container(height: 70),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
