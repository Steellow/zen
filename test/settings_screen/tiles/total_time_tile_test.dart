import 'package:flutter_test/flutter_test.dart';
import 'package:zen_app/settings_screen/tiles/total_time_tile.dart';

void main() {
  test('getTitle_totalMinutes40', () {
    expect(const TotalTimeTile().getTitle(40), "40 minutes");
  });

  test('getTitle_totalMinutes69', () {
    expect(const TotalTimeTile().getTitle(69), "1 hour 9 minutes");
  });

  test('getTitle_totalMinutes420', () {
    expect(const TotalTimeTile().getTitle(420), "7 hours");
  });

  test('getTitle_totalMinutes421', () {
    expect(const TotalTimeTile().getTitle(421), "7 hours 1 minutes");
  });

  test('getTitle_totalMinutes1337', () {
    expect(const TotalTimeTile().getTitle(1337), "22 hours");
  });
}
