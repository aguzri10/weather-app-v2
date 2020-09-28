import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/providers/providers.dart';
import 'package:open_weather_mobile/view/widgets/weather_widget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _state = SearchWeatherState();

  bool _loading = false;
  String _query;

  @override
  void initState() {
    super.initState();
  }

  void _search(String query) async {
    final prov = Provider.of<AppProviders>(context, listen: false);

    if (query != null) {
      setState(() {
        _loading = true;
        _state.query = query;
      });
      try {
        await prov.getSearch(_state);
        if (!mounted) return;
      } catch (e) {
        print(e);
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProviders>(builder: (context, value, child) {
      final weather = value.searchWeather;

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
                  color: Color(0xFFFA00FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -20,
              bottom: 120,
              child: Container(
                height: 289,
                width: 289,
                decoration: BoxDecoration(
                  color: Color(0xFFFF8493),
                  shape: BoxShape.circle,
                ),
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
                            _search(term.toLowerCase());
                          },
                        ),
                      ),
                      if (_loading) ...[
                        SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      ],
                      if (weather != null) ...[
                        ..._buildSectionWeather(weather),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

List<Widget> _buildSectionWeather(CurrentWeather weather) {
  return [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: WeatherWidget(weather: weather),
      ),
    )
  ];
}
