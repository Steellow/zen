import 'package:flutter/material.dart';
import 'package:zen_app/intro_screen/widgets/description_text.dart';
import 'package:zen_app/intro_screen/widgets/intro_image.dart';
import 'package:zen_app/util/styles.dart';

class CustomIntroPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget? button;

  const CustomIntroPage(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroImage(
          image: imagePath,
          padding: 34,
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
