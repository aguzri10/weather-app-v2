import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/models/hourly.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';

class HourlyWidget extends StatelessWidget {
  final Hourly hourly;

  const HourlyWidget({Key key, @required this.hourly}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Utils.getDateFromUnix(hourly.dt),
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B0040),
              fontWeight: FontWeight.w500,
            ),
          ),
          Image.network(
            Utils.urlIcon(hourly?.weather[0]?.icon),
            scale: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hourly == null
                    ? '27'
                    : Utils.getCelciusFromKelvin(hourly.temp)
                        .toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B0040),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFF6B0040), width: 2),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
