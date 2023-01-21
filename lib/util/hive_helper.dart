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

const String BOX_KEY_TOTAL_SECONDS_MEDITATED = "totalSecondsMeditated";
const String BOX_KEY_TOTAL_TIMES_MEDITATED = "totalTimesMeditated";

int getTotalSecondsMeditated() => Hive.box(BOX_NAME_QUICK_STATS)
    .get(BOX_KEY_TOTAL_SECONDS_MEDITATED, defaultValue: 0);

int getTotalTimesMeditated() => Hive.box(BOX_NAME_QUICK_STATS)
    .get(BOX_KEY_TOTAL_TIMES_MEDITATED, defaultValue: 0);

void addMeditation(int seconds) {
  int currentSeconds = getTotalSecondsMeditated();
  int currentTimes = getTotalTimesMeditated();

  Box box = Hive.box(BOX_NAME_QUICK_STATS);
  box.put(BOX_KEY_TOTAL_SECONDS_MEDITATED, currentSeconds + seconds);
  box.put(BOX_KEY_TOTAL_TIMES_MEDITATED, currentTimes + 1);
}

void deleteStats() => Hive.box(BOX_NAME_QUICK_STATS).clear();

//////////////////
// SETTINGS BOX //
//////////////////

const String BOX_NAME_SETTINGS = "settingsBox";

const String BOX_KEY_CONFETTI_ENABLED = "confettiEnabled";

bool isConfettiEnabled() => Hive.box(BOX_NAME_SETTINGS)
    .get(BOX_KEY_CONFETTI_ENABLED, defaultValue: true);

void setConfettiEnabled(bool value) =>
    Hive.box(BOX_NAME_SETTINGS).put(BOX_KEY_CONFETTI_ENABLED, value);
