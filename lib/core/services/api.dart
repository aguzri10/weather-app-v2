import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/services/env.dart';

const headers = {'Content-Type': 'application/json'};

String noInternetText = 'Tidak ada koneksi internet';
String gatewayTimeOutText = 'Tidak dapat terhubung ke server';

class Api {
  static Future<Map<String, dynamic>> getCurrentWeatherByLatLon(
      CurrentWeatherState state) async {
    try {
      final response = await http.get(
        weatherURL + '?lat=${state.lat}&lon=${state.lon}&appid=${state.appId}',
        headers: headers,
      );
      final Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonDecoded;
      } else {
        throw jsonDecoded['error']['message'];
      }
    } on FormatException {
      throw gatewayTimeOutText;
    } on SocketException {
      throw noInternetText;
    } catch (e) {
      throw e;
    }
  }
}
