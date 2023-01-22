import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen/home_screen/home_screen.dart';
import 'package:zen/intro_screen/intro_screen.dart';
import 'package:zen/util/hive_helper.dart';
import 'package:zen/util/styles.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(BOX_NAME_MEDITATION_TIME);
  await Hive.openBox(BOX_NAME_QUICK_STATS);
  await Hive.openBox(BOX_NAME_SETTINGS);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zen',
      theme: Styles.myThemeData,
      home: isFirstLaunch() ? const IntroScreen() : const HomeScreen(),
    );
  }
}
