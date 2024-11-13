import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  // Check and request location service and permission together
  Future<LocationData> getLocation() async {
    await ensureServiceEnabled();
    await ensurePermissionGranted();
    return await location.getLocation();
  }

  // Listens for real-time location updates
  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await ensureServiceEnabled();
    await ensurePermissionGranted();
    location.onLocationChanged.listen(onData);
  }

  // Private helper to check and request location service
  Future<void> ensureServiceEnabled() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException("Location service is disabled.");
      }
    }
  }

  // Private helper to check and request location permission
  Future<void> ensurePermissionGranted() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException(
          "Location permission is permanently denied.");
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException("Location permission is denied.");
      }
    }
  }
}

// Custom exceptions for clarity
class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);

  @override
  String toString() => "LocationServiceException: $message";
}

class LocationPermissionException implements Exception {
  final String message;
  LocationPermissionException(this.message);

  @override
  String toString() => "LocationPermissionException: $message";
}
