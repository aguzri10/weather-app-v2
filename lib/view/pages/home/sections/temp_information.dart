import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';

class TempInformation extends StatelessWidget {
  final Address address;
  final CurrentWeather currentWeather;

  const TempInformation({
    Key key,
    @required this.address,
    @required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              Utils.urlIcon(currentWeather?.weather[0]?.icon),
              width: 182,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentWeather == null
                    ? '27'
                    : Utils.getCelciusFromKelvin(currentWeather.main.temp)
                        .toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 64,
                  color: Color(0XFF6B0040),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0XFF6B0040), width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                'c',
                style: TextStyle(
                  fontSize: 64,
                  color: Color(0XFF6B0040),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
