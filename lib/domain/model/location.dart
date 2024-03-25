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
    return 0.0;
  }
}
