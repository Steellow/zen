import 'dart:math';

double randomBetween(double min, double max) =>
    Random().nextDouble() * (max - min) + min;

int getCurrentHour() => DateTime.now().hour;
