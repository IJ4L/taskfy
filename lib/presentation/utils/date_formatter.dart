import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  String dateFromatNow() {
    DateTime currentTime = DateTime.now();
    String formattedDate = DateFormat('MMM, yyyy', 'en_US').format(currentTime);

    return formattedDate;
  }

  int getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd').format(now);
    return int.parse(formattedDate);
  }

  List<String> getDaysOfMonth(int month) {
    List<String> daysList = [];

    initializeDateFormatting('en_US', null);

    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, month, 1);
    int numberOfDaysInMonth = DateTime(now.year, month + 1, 0).day;

    for (int i = 0; i < numberOfDaysInMonth; i++) {
      DateTime nextDate = firstDayOfMonth.add(Duration(days: i));
      String formattedDay = DateFormat('EEEE', 'en_US').format(nextDate);
      daysList.add(formattedDay);
    }

    return daysList;
  }
}
