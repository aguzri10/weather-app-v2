import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/models/hourly.dart';

class HourlyTemp extends StatelessWidget {
  final List<Hourly> hourlys;

  const HourlyTemp({Key key, this.hourlys}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 16),
      itemBuilder: (context, index) {
        return Container();
      },
      separatorBuilder: (context, i) {
        return SizedBox(width: 8);
      },
      itemCount: hourlys.length,
    );
  }
}