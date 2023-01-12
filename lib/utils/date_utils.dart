import 'package:intl/intl.dart';

enum CalendarEnum { gregorian, buddhist }

enum DateFormatEnum { shortDate, shortDateShortYear }

extension DateFormatPattern on DateFormatEnum {
  String get pattern {
    switch (this) {
      case DateFormatEnum.shortDate:
        return 'dd/MM/yyyy';
      case DateFormatEnum.shortDateShortYear:
        return 'dd/MM/yy';
    }
  }
}

class DateUtils {
  static String? convertToString(
    DateTime? date,
    DateFormatEnum format, [
    CalendarEnum calendar = CalendarEnum.gregorian,
  ]) {
    if (date == null) {
      return null;
    }
    final DateFormat dateFormat = DateFormat(format.pattern);
    String dateString = dateFormat.format(date);
    if (calendar == CalendarEnum.buddhist) {
      List<String> split = dateString.split('/');
      String day = split[0];
      String month = split[1];
      String shortYear = getShortYear(date, calendar);
      String fullYear = getFullYear(date, calendar);
      switch (format) {
        case DateFormatEnum.shortDate:
          dateString = '$day/$month/$fullYear';
          break;
        case DateFormatEnum.shortDateShortYear:
          dateString = '$day/$month/$shortYear';
          break;
      }
    }
    return dateString;
  }

  static String getFullYear(DateTime date,
      [CalendarEnum calendar = CalendarEnum.gregorian]) {
    return getYearString(date, 'yyyy', calendar);
  }

  static String getShortYear(DateTime date,
      [CalendarEnum calendar = CalendarEnum.gregorian]) {
    return getYearString(date, 'yy', calendar);
  }

  static String getYearString(
    DateTime date,
    String yearFormat, [
    CalendarEnum calendar = CalendarEnum.gregorian,
  ]) {
    final DateFormat dateFormat = DateFormat(yearFormat);
    switch (calendar) {
      case CalendarEnum.gregorian:
        return dateFormat.format(date);
      case CalendarEnum.buddhist:
        return dateFormat.format(DateTime(getYear(date, calendar)));
    }
  }

  static int getYear(DateTime date,
      [CalendarEnum calendar = CalendarEnum.gregorian]) {
    switch (calendar) {
      case CalendarEnum.gregorian:
        return date.year;
      case CalendarEnum.buddhist:
        return date.year + 543;
    }
  }
}
