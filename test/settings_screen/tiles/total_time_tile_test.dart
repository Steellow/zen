import 'package:flutter_test/flutter_test.dart';
import 'package:zen_app/settings_screen/tiles/total_time_tile.dart';

void main() {
  test('getTimeMeditatedAsString_totalMinutes40', () {
    expect(getTimeMeditatedAsString(40 * 60), "40 minutes");
  });

  test('getTimeMeditatedAsString_totalMinutes69', () {
    expect(getTimeMeditatedAsString(69 * 60), "1 hour 9 minutes");
  });

  test('getTimeMeditatedAsString_totalMinutes420', () {
    expect(getTimeMeditatedAsString(420 * 60), "7 hours");
  });

  test('getTimeMeditatedAsString_totalMinutes421', () {
    expect(getTimeMeditatedAsString(421 * 60), "7 hours 1 minutes");
  });

  test('getTimeMeditatedAsString_totalMinutes1337', () {
    expect(getTimeMeditatedAsString(1337 * 60), "22 hours");
  });
}
