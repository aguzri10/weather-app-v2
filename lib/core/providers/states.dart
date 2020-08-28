import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

class StatesProvider extends ChangeNotifier {
  LocationData _locationData;
  LocationData get locationData => _locationData;

  void getLocationData(LocationData locationData) {
    _locationData = locationData;
    notifyListeners();
  }
}
