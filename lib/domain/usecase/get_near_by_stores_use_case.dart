import 'package:clean_arch/domain/model/location.dart';
import 'package:clean_arch/domain/model/permission.dart';
import 'package:clean_arch/domain/model/store.dart';
import 'package:clean_arch/domain/permission/location_permission_handler.dart';
import 'package:clean_arch/domain/repository/location_repository.dart';
import 'package:clean_arch/domain/repository/store_repository.dart';

class GetNearByStoresUseCase {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;
  final LocationPermissionHandler _locationPermissionHandler;

  GetNearByStoresUseCase({
    required StoreRepository storeRepository,
    required LocationRepository locationRepository,
    required LocationPermissionHandler locationPermissionHandler,
  })  : _storeRepository = storeRepository,
        _locationRepository = locationRepository,
        _locationPermissionHandler = locationPermissionHandler;

  Future<List<Store>> execute() async {
    final stores = await _storeRepository.getStores();

    // Check location service
    final isServiceEnabled =
        await _locationPermissionHandler.isLocationServiceEnabled();

    // Check premission
    if (isServiceEnabled) {
      // Get location
      final permission = await _locationPermissionHandler.checkPermission();

      // denied
      if (permission == Permission.denied) {
        print('Permission denied');
        return stores;
      }

      // deniedForever
      if (permission == Permission.deniedForever) {
        print('Permission denied forever');
        return stores;
      }

      // granted
      final location = await _locationRepository.getLocation();

      return stores
          .map(
            (store) => store.copyWith(
              distance: location.distanceBetween(Location(
                latitude: store.latitude,
                longitude: store.longitude,
              )),
            ),
          )
          .toList()
        ..sort((a, b) => a.distance.compareTo(b.distance));
    }

    return stores;
  }
}
