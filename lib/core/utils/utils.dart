import 'package:intl/intl.dart';

class Utils {

  // example : 
  static String getFormatDateHistory(DateTime date) {
    // final DateTime date = DateTime.parse(source);
    return DateFormat('EEE, d MMM').format(date);
  }
}