import 'package:clean_arch/domain/model/location.dart';
import 'package:clean_arch/domain/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@prod
@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
