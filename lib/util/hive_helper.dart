// ignore_for_file: constant_identifier_names, avoid_print

import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_app/util/util.dart';

/////////////////////////
// MEDITATION TIME BOX //
/////////////////////////

const String BOX_NAME_MEDITATION_TIME = "meditationTimeBox";

// Meditation time is stored in minutes, as double
const String BOX_KEY_MIN_MEDITAION_TIME = "minMeditationTime";
const String BOX_KEY_MAX_MEDITAION_TIME = "maxMeditationTime";

double getMeditationTimeInSeconds() {
  Box box = Hive.box(BOX_NAME_MEDITATION_TIME);

  double minTime = box.get(BOX_KEY_MIN_MEDITAION_TIME, defaultValue: 10.0) * 60;
  double maxTime = box.get(BOX_KEY_MAX_MEDITAION_TIME, defaultValue: 20.0) * 60;

  double random = randomBetween(minTime, maxTime);
  print('Generated random value of $random');
  return random;
}

/////////////////////
// QUICK STATS BOX //
/////////////////////

const String BOX_NAME_QUICK_STATS = "quickStatsBox";

const String BOX_KEY_TOTAL_MINUTES_MEDITATED = "totalMinutesMeditated";
const String BOX_KEY_TOTAL_TIMES_MEDITATED = "totalTimesMeditated";
