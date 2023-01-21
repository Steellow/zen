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

  static TextStyle numberPickerTextStyle = TextStyle(
    color: buttonColor,
    fontSize: 30,
  );

  static const TextStyle settingsSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
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
    primaryColor: buttonColor,
    toggleableActiveColor: buttonColor,
    brightness: Brightness.dark,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
      ),
    ),
  );

  static Color buttonColor = Colors.blue[300]!;
}
