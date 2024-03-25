import 'package:geolocator/geolocator.dart';

class Location {
  final num latitude;
  final num longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });
}

extension DistanceBetween on Location {
  num distanceBetween(Location location) {
    return Geolocator.distanceBetween(
      latitude.toDouble(),
      longitude.toDouble(),
      location.latitude.toDouble(),
      location.longitude.toDouble(),
    );
  }
}
