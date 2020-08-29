import 'package:intl/intl.dart';
import 'package:open_weather_mobile/core/services/env.dart';

class Utils {
  // example :
  static String getFormatDate(DateTime date) {
    // final DateTime date = DateTime.parse(source);
    return DateFormat('EEE, d MMM yyyy').format(date);
  }

  static double getCelciusFromKelvin(double i) {
    final celcius = i - 273.15;
    return celcius;
  }

  static String urlIcon(String icon) {
    final url = '$URLIcon/$icon@2x.png';
    return url;
  }
}
