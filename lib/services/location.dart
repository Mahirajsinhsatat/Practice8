import 'dart:core';

import 'package:geolocator/geolocator.dart';

class Location{

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Check for location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      // Define location settings
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
      );

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print("Error getting location: $e");
    }
  }
}