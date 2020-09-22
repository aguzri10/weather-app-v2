import 'package:flutter/foundation.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/models/hourly.dart';
import 'package:open_weather_mobile/core/services/api.dart';

class AppProviders extends ChangeNotifier {
  CurrentWeather _currentWeatherLatLng;
  CurrentWeather get currentWeatherLatlng => _currentWeatherLatLng;

  List<Hourly> _hourlys;
  List<Hourly> get hourlys => _hourlys;

  Future<void> getCurrentWeatherLatLng(CurrentWeatherState state) async {
    try {
      final response = await Api.getCurrentWeatherByLatLon(state);
      _currentWeatherLatLng =
          response != null ? CurrentWeather.fromJson(response) : null;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getHourlyWeather(CurrentWeatherState state) async {
    try {
      final response = await Api.getOneCallHourly(state);
      _hourlys = response['hourly'] != null &&
              (response['hourly'] as List).isNotEmpty
          ? (response['hourly'] as List).map((e) => Hourly.fromJson(e)).toList()
          : null;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
