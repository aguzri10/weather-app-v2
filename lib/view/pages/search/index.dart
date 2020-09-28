import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';
import 'package:open_weather_mobile/view/widgets/weather_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -20,
            top: 120,
            child: Container(
              height: 289,
              width: 289,
              decoration: BoxDecoration(
                  color: Color(0xFFFA00FF), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            left: -20,
            bottom: 120,
            child: Container(
              height: 289,
              width: 289,
              decoration: BoxDecoration(
                  color: Color(0xFFFF8493), shape: BoxShape.circle),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
            child: Container(
              color: Colors.white.withOpacity(0.40),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      brightness: Brightness.light,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      pinned: true,
                      title: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(hintText: 'Cari kota...'),
                        onFieldSubmitted: (term) {
                          print(term);
                        },
                      ),
                    ),
                    ..._buildSectionWeather(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildSectionWeather() {
  return [
    SliverToBoxAdapter(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return WeatherWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
        itemCount: 10,
      ),
    )
  ];
}
