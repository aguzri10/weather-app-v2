import 'package:flutter/foundation.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/services/api.dart';

class AppProviders extends ChangeNotifier {
  CurrentWeather _currentWeatherLatLng;
  CurrentWeather get currentWeatherLatlng => _currentWeatherLatLng;

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
}
