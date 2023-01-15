import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/home_screen/home_screen.dart';
import 'package:zen_app/util/hive_helper.dart';
import 'package:zen_app/util/styles.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(BOX_NAME_MEDITATION_TIME);

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
      home: const HomeScreen(),
    );
  }
}
