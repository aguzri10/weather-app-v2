import 'package:flutter/material.dart';
import 'package:open_weather_mobile/view/styles/color.dart';

class TempInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '27',
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
        SizedBox(height: 8),
        Text(
          'Tebet, Jakarta Selatan',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[300],
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
