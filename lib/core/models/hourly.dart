import 'package:open_weather_mobile/core/models/current_weather.dart';

class Hourly {
  final int dt, pressure, humidity, clouds, visibility, windDeg;
  final double temp, feelsLike, dewPoint, windSpeed, pop;
  final List<Weather> weather;

  Hourly({
    this.dt,
    this.pressure,
    this.humidity,
    this.clouds,
    this.visibility,
    this.windDeg,
    this.temp,
    this.feelsLike,
    this.dewPoint,
    this.windSpeed,
    this.pop,
    this.weather,
  });

  Hourly.fromJson(Map<String, dynamic> json)
      : dt = json['dt'],
        pressure = json['pressure'],
        humidity = json['humidity'],
        clouds = json['clouds'],
        visibility = json['visibility'],
        windDeg = json['wind_deg'],
        temp = json['temp'],
        feelsLike = json['feels_like'],
        dewPoint = json['dew_point'],
        windSpeed = json['wind_speed'],
        pop = json['pop'],
        weather = json['weather'] != null
            ? (json['weather'] as List).map((e) => Weather.fromJson(e)).toList()
            : null;
}
