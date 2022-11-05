import 'package:intl/intl.dart';

DateTime? jsonToTime(String? timeString) {
  if (timeString == null) return null;
  var time = DateTime.parse(timeString);
  return time;
}

String? timeToJson(DateTime? date) {
  if (date == null) return null;
  var time = date.toIso8601String();
  return time;
}

extension DateTimeParse on DateTime {
  String convertDate(String dateFormat) {
    final docDateTime = DateTime.parse(toString());
    return DateFormat(dateFormat).format(docDateTime);
  }
}
