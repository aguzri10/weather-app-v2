import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

class AddressInformation extends StatelessWidget {
  final Address address;

  const AddressInformation({Key key, @required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: Color(0xFF6B0040)),
          SizedBox(width: 8),
          Text(
            '${address?.locality}, ${address?.subAdminArea}',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B0040),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
