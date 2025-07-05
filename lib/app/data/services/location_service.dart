import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }
  
  Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }
  
  Future<Position?> getCurrentLocation() async {
    try {
      final hasPermission = await checkLocationPermission();
      if (!hasPermission) {
        final granted = await requestLocationPermission();
        if (!granted) {
          return null;
        }
      }
      
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      return position;
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }
  
  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
  
  String formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.round()} m';
    } else {
      final distanceInKm = distanceInMeters / 1000;
      return '${distanceInKm.toStringAsFixed(1)} km';
    }
  }
  
  String formatDuration(double distanceInMeters) {
    // Assuming average speed of 20 km/h for delivery
    final speedInMps = 20 * 1000 / 3600; // 20 km/h to m/s
    final durationInSeconds = distanceInMeters / speedInMps;
    final durationInMinutes = durationInSeconds / 60;
    
    if (durationInMinutes < 1) {
      return '< 1 min';
    } else if (durationInMinutes < 60) {
      return '${durationInMinutes.round()} min';
    } else {
      final hours = (durationInMinutes / 60).floor();
      final minutes = (durationInMinutes % 60).round();
      return '${hours}h ${minutes}m';
    }
  }
  
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
} 