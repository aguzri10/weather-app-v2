import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:open_weather_mobile/core/providers/states.dart';
import 'package:open_weather_mobile/view/styles/color.dart';
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
  Location _location = Location();
  bool _servicesEnable;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Address _address;

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

  _showInfoLocation() {
    Dialogs.showDialogInformation(
      context: context,
      title: '${_address.locality}, ${_address.subAdminArea}',
      description: '${_address.addressLine}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
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
          ..._buildSectionDateInformation(),
          ..._buildSectionTempInformation(_address),
        ],
      ),
    );
  }
}

List<Widget> _buildSectionDateInformation() {
  return [
    SliverToBoxAdapter(child: DateInformation()),
    SliverToBoxAdapter(child: SizedBox(height: 26)),
  ];
}

List<Widget> _buildSectionTempInformation(Address address) {
  return [
    SliverToBoxAdapter(child: TempInformation(address: address)),
  ];
}
