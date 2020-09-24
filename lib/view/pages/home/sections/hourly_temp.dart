import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/models/hourly.dart';
import 'package:open_weather_mobile/view/widgets/hourly_widget.dart';

class HourlyTemp extends StatefulWidget {
  final List<Hourly> hourlys;

  const HourlyTemp({Key key, this.hourlys}) : super(key: key);

  @override
  _HourlyTempState createState() => _HourlyTempState();
}

class _HourlyTempState extends State<HourlyTemp> {
  List<Hourly> _hourlys;
  List<List<Hourly>> hourlysSliced = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    setState(() {
      _hourlys = widget.hourlys;
    });
    for (var index = 0; index < _hourlys.length; index++) {
      for (var i = 0; i < _hourlys.length; i++) {
        if (index == i) {
          if (i + 5 > _hourlys.length) {
            hourlysSliced.add(_hourlys.sublist(i, i + 1));
          } else {
            hourlysSliced.add(_hourlys.sublist(i, i + 5));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.92,
            ),
            itemCount: hourlysSliced.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var hourly in hourlysSliced[index]) ...[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 5) - 23,
                        child: HourlyWidget(hourly: hourly),
                      ),
                    ]
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 16,
              decoration: BoxDecoration(
                color: Color(0xFFBB6BD9),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color(0xFFBB6BD9),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color(0xFFBB6BD9),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color(0xFFBB6BD9),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
        SizedBox(height: 32),
      ],
    );

    // return ListView.separated(
    //   scrollDirection: Axis.horizontal,
    //   shrinkWrap: true,
    //   padding: EdgeInsets.only(left: 16),
    //   itemBuilder: (context, index) {
    //     return HourlyWidget(hourly: widget.hourlys[index]);
    //   },
    //   separatorBuilder: (context, i) {
    //     return SizedBox(width: 8);
    //   },
    //   itemCount: widget.hourlys.length,
    // );
  }
}
