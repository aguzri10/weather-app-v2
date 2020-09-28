import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.30),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Utils.handleCondition('few clouds'),
            width: 26,
          ),
          SizedBox(width: 8),
          Container(
            height: 30,
            width: 1,
            color: Colors.black.withOpacity(0.50),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jakarta Selatan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B0040),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Few Clouds',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B0040),
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '27',
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
