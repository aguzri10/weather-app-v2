import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:open_weather_mobile/core/models/current_weather.dart';
import 'package:open_weather_mobile/core/models/hourly.dart';
import 'package:open_weather_mobile/core/providers/providers.dart';
import 'package:open_weather_mobile/core/providers/states.dart';
import 'package:open_weather_mobile/core/utils/utils.dart';
import 'package:open_weather_mobile/view/pages/home/sections/hourly_temp.dart';
import 'package:open_weather_mobile/view/styles/constants.dart';
import 'package:open_weather_mobile/view/widgets/custom_inkwell.dart';
import 'package:open_weather_mobile/view/widgets/dialogs/dialogs.dart';
import 'package:provider/provider.dart';

import 'sections/date_information.dart';
import 'sections/temp_information.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _currentWeatherState = CurrentWeatherState();
  final dateTime = DateTime.now();

  Location _location = Location();
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Address _address;

  bool _loading = false;
  bool _servicesEnable;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _servicesEnable = await _location.serviceEnabled();
    if (!_servicesEnable) {
      _servicesEnable = await _location.requestService();
      if (!_servicesEnable) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
    if (_locationData != null) {
      final state = Provider.of<StatesProvider>(context, listen: false);
      setState(() {
        state.getLocationData(_locationData);
      });

      _getAddress();
      _getWeather();
    }
  }

  void _getAddress() async {
    final coordinates =
        Coordinates(_locationData?.latitude, _locationData?.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      _address = addresses.first;
    });
  }

  void _getWeather() async {
    final prov = Provider.of<AppProviders>(context, listen: false);
    setState(() {
      _loading = true;
      _currentWeatherState.lat = _locationData.latitude.toString();
      _currentWeatherState.lon = _locationData.longitude.toString();
    });
    try {
      await Future.wait(
        [
          prov.getCurrentWeatherLatLng(_currentWeatherState),
          prov.getHourlyWeather(_currentWeatherState),
        ],
      );

      if (!mounted) return;
    } catch (e) {
      throw e;
    }
    setState(() {
      _loading = false;
    });
  }

  _showInfoLocation() {
    Dialogs.showDialogInformation(
      context: context,
      title: '${_address.locality}, ${_address.subAdminArea}',
      description: '${_address.addressLine}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProviders>(builder: (context, value, child) {
      final currentWeather = value.currentWeatherLatlng;
      final hourlys = value.hourlys ?? [];

      return Scaffold(
        body: _loading
            ? CircularProgressIndicator()
            : Stack(
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
                              leading: CustomInkwell(
                                onTap: _showInfoLocation,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(iconMenu),
                                ),
                              ),
                            ),
                            if (currentWeather != null) ...[
                              ..._buildSectionAddress(_address),
                              ..._buildSectionDateInformation(dateTime),
                              ..._buildSectionTempInformation(currentWeather),
                            ],
                          ],
                        ),
                      ),
                      ..._buildSectionHourlyTemp(hourlys),
                    ],
                  ),
                ],
              ),
      );
    });
  }
}

List<Widget> _buildSectionAddress(Address address) {
  return [
    SliverToBoxAdapter(child: AddressInformation(address: address)),
    SliverToBoxAdapter(child: SizedBox(height: 26)),
  ];
}

List<Widget> _buildSectionDateInformation(DateTime dateTime) {
  return [
    SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFF6B0040),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Utils.getFormatDate(dateTime),
                  style: TextStyle(fontSize: 18, color: Color(0XFF6B0040)),
                )
              ],
            ),
          ],
        ),
      ),
    )
  ];
}

List<Widget> _buildSectionTempInformation(CurrentWeather currentWeather) {
  return [
    SliverToBoxAdapter(child: TempInformation(currentWeather: currentWeather)),
  ];
}

List<Widget> _buildSectionHourlyTemp(List<Hourly> hourlys) {
  return [
    Container(
      height: 152,
      padding: EdgeInsets.symmetric(vertical: 16),
      color: Colors.white.withOpacity(0.20),
      child: HourlyTemp(hourlys: hourlys),
    )
  ];
}
