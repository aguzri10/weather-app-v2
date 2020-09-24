import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';

class TempInformation extends StatelessWidget {
  final CurrentWeather currentWeather;

  const TempInformation({
    Key key,
    @required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 53),
        Center(
          child: Image.asset(
            Utils.handleCondition(currentWeather?.weather[0].desc),
            width: 222,
          ),
        ),
        SizedBox(height: 70),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20),
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
    );
  }
}
