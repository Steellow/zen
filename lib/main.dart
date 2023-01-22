import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'zen',
          theme: ThemeData(
            primaryColor: Styles.buttonColor,
            toggleableActiveColor: Styles.buttonColor,
            brightness: Brightness.dark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Styles.buttonColor,
              ),
            ),
            textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),
          ),
          home: isFirstLaunch() ? const IntroScreen() : const HomeScreen(),
        );
      },
    );
  }
}
