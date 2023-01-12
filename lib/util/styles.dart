import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle titleText = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    shadows: [bigTextShadow],
  );

  static const TextStyle floatingButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    letterSpacing: 4,
    shadows: [smallTextShadow],
  );

  static const Shadow bigTextShadow = Shadow(
    blurRadius: 10,
    offset: Offset(5, 5),
    color: Colors.black38,
  );

  static const Shadow smallTextShadow = Shadow(
    blurRadius: 4,
    offset: Offset(2, 2),
    color: Colors.black38,
  );

  static ThemeData myThemeData = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: buttonColor,
      // extendedTextStyle doesn't work for some reason. Check floatingButtonTextStyle
    ),
  );

  static const Color buttonColor = Color(0xff5CBBD7);
}
