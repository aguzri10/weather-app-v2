import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

class AddressInformation extends StatelessWidget {
  final Address address;

  const AddressInformation({Key key, @required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final dateNow = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.network(
          //   Utils.urlIcon(currentWeather?.weather[0]?.icon),
          //   scale: 2,
          // ),
          // SizedBox(width: 8),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Today',
          //       style: TextStyle(fontSize: 14, color: Colors.white),
          //     ),
          //     Text(
          //       Utils.getFormatDateHistory(dateNow),
          //       style: TextStyle(fontSize: 10, color: Colors.white),
          //     )
          //   ],
          // )
          Icon(Icons.location_on, color: Color(0xFF6B0040)),
          SizedBox(width: 8),
          Text(
            '${address?.locality}, ${address?.subAdminArea}',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B0040),
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
