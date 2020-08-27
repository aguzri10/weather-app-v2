import 'package:flutter/material.dart';

class DateInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Sat, 3 Aug',
              style: TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
