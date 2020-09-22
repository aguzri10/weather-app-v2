import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';
import 'package:open_weather_mobile/view/styles/color.dart';

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
    final dateNow = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 32, color: Color(0xFF6B0040)),
              ),
              Text(
                Utils.getFormatDate(dateNow),
                style: TextStyle(fontSize: 18, color: Color(0XFF6B0040)),
              )
            ],
          ),
          SizedBox(height: 56),
          Image.network(
            Utils.urlIcon(currentWeather?.weather[0]?.icon),
            scale: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentWeather == null
                    ? '27'
                    : Utils.getCelciusFromKelvin(currentWeather.main.temp)
                        .toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                'c',
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.white,
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
