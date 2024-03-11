import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  late String currentLocation;

  String get CurrentLocation => currentLocation;

  LocationProvider() {
    currentLocation = "Bilinmeyen Konum";
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      currentLocation = placemarks[0].administrativeArea ?? "Bilinmeyen Konum";
      notifyListeners();
    } catch (e) {
      print("Konum alınamadı: $e");
    }
  }
}
