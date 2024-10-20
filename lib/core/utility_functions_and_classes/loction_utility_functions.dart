import 'package:location/location.dart';

class LocationUtilityFunctions {
  final Location _location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  Future<void> initialize() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
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
  }

  Stream<LocationData> getLocationUpdates() {
    _location.changeSettings(
      interval: 3000, //update every 3 seconds
      distanceFilter: 5, //update when current location changes by 5 meters
    );
    return _location.onLocationChanged;
  }

  Future<LocationData> getCurrentLocation() async {
    _location.changeSettings(
      interval: 3000, //update every 3 seconds
      distanceFilter: 5, //update when current location changes by 5 meters
    );
    return await _location.getLocation();
  }
}
