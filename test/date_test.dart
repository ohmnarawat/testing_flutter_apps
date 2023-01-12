import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter_apps/utils/date_utils.dart';

void main() {
  test('Convert date to string in Gregorian calendar', () {
    // 01-01-1989
    String? result1 = DateUtils.convertToString(DateTime(1989, 9, 20), DateFormatEnum.shortDate);
    // 29-02-2020
    String? result2 = DateUtils.convertToString(DateTime(2020, 2, 29), DateFormatEnum.shortDate);
    // 01-01-2023
    String? result3 = DateUtils.convertToString(DateTime(2023, 1, 1), DateFormatEnum.shortDateShortYear);
    // 07-08-2000
    String? result4 = DateUtils.convertToString(DateTime(2000, 8, 7), DateFormatEnum.shortDateShortYear);
    // null
    String? result5 = DateUtils.convertToString(null, DateFormatEnum.shortDateShortYear);

    expect(result1, '20/09/1989');
    expect(result2, '29/02/2020');
    expect(result3, '01/01/23');
    expect(result4, '07/08/00');
    expect(result5, null);
  });
  test('Convert date to string in Buddhist calendar', () {
    // 01-01-1989
    String? result1 = DateUtils.convertToString(DateTime(1989, 9, 20), DateFormatEnum.shortDate, CalendarEnum.buddhist);
    // 29-02-2020
    String? result2 = DateUtils.convertToString(DateTime(2020, 2, 29), DateFormatEnum.shortDate, CalendarEnum.buddhist);
    // 01-01-2023
    String? result3 = DateUtils.convertToString(DateTime(2023, 1, 1), DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);
    // 07-08-2000
    String? result4 = DateUtils.convertToString(DateTime(2000, 8, 7), DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);
    // null
    String? result5 = DateUtils.convertToString(null, DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);

    expect(result1, '20/09/2532');
    expect(result2, '29/02/2563');
    expect(result3, '01/01/66');
    expect(result4, '07/08/43');
    expect(result5, null);
  });
  // group('Convert date to string', () {
  //   test('In Gregorian calendar', () {
  //     // 01-01-1989
  //     String? result1 = DateUtils.convertToString(DateTime(1989, 9, 20), DateFormatEnum.shortDate);
  //     // 29-02-2020
  //     String? result2 = DateUtils.convertToString(DateTime(2020, 2, 29), DateFormatEnum.shortDate);
  //     // 01-01-2023
  //     String? result3 = DateUtils.convertToString(DateTime(2023, 1, 1), DateFormatEnum.shortDateShortYear);
  //     // 07-08-2000
  //     String? result4 = DateUtils.convertToString(DateTime(2000, 8, 7), DateFormatEnum.shortDateShortYear);
  //     // null
  //     String? result5 = DateUtils.convertToString(null, DateFormatEnum.shortDateShortYear);
  //
  //     expect(result1, '20/09/1989');
  //     expect(result2, '29/02/2020');
  //     expect(result3, '01/01/23');
  //     expect(result4, '07/08/00');
  //     expect(result5, null);
  //   });
  //   test('In Buddhist calendar', () {
  //     // 01-01-1989
  //     String? result1 = DateUtils.convertToString(DateTime(1989, 9, 20), DateFormatEnum.shortDate, CalendarEnum.buddhist);
  //     // 29-02-2020
  //     String? result2 = DateUtils.convertToString(DateTime(2020, 2, 29), DateFormatEnum.shortDate, CalendarEnum.buddhist);
  //     // 01-01-2023
  //     String? result3 = DateUtils.convertToString(DateTime(2023, 1, 1), DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);
  //     // 07-08-2000
  //     String? result4 = DateUtils.convertToString(DateTime(2000, 8, 7), DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);
  //     // null
  //     String? result5 = DateUtils.convertToString(null, DateFormatEnum.shortDateShortYear, CalendarEnum.buddhist);
  //
  //     expect(result1, '20/09/2532');
  //     expect(result2, '29/02/2563');
  //     expect(result3, '01/01/66');
  //     expect(result4, '07/08/43');
  //     expect(result5, null);
  //   });
  // });
}
