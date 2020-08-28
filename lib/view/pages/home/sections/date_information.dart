import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';

class DateInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dateNow = DateTime.now();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.cloud, color: Colors.white),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              Utils.getFormatDateHistory(dateNow),
              style: TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
