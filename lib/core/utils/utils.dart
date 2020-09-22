import 'package:intl/intl.dart';
import 'package:open_weather_mobile/core/services/env.dart';
import 'package:open_weather_mobile/view/styles/constants.dart';

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
    final url = '$URLIcon/$icon@4x.png';
    return url;
  }

  static getDateFromUnix(int unix) {
    final date = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    final format = DateFormat('HH:mm');
    final dateTime = format.format(date);

    return dateTime;
  }

  static String handleCondition(String source) {
    if (source.contains('clear')) {
      return iconClear;
    } else if (source.contains('few')) {
      return iconFewClouds;
    } else if (source.contains('scattered')) {
      return iconScatteredClouds;
    } else if (source.contains('rain')) {
      return iconRain;
    }

    return iconClear;
  }
}
