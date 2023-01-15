import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle titleText = titleTextWithoutShadow.copyWith(
    shadows: [bigTextShadow],
  );

  static const TextStyle titleTextWithoutShadow = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle basicText = TextStyle(
    shadows: [smallTextShadow],
  );

  static const TextStyle floatingButtonTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: 6,
    shadows: [smallTextShadow],
  );

  static const TextStyle numberPickerTextStyle = TextStyle(
    color: buttonColor,
    fontSize: 30,
  );

  static const Shadow bigTextShadow = Shadow(
    blurRadius: 10,
    offset: Offset(0, 5),
    color: Colors.black38,
  );

  static const Shadow smallTextShadow = Shadow(
    blurRadius: 6,
    offset: Offset(0, 2),
    color: Colors.black54,
  );

  static ThemeData myThemeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyText2: basicText,
    ),
  );

  static const Color buttonColor = Color(0xff5CBBD7);
}
