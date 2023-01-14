import 'package:flutter/material.dart';
import 'package:zen_app/home_screen/home_screen.dart';
import 'package:zen_app/util/styles.dart';

void main() {
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
