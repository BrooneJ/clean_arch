import 'package:clean_arch/domain/model/location.dart';
import 'package:clean_arch/domain/model/permission.dart';
import 'package:clean_arch/domain/model/store.dart';
import 'package:clean_arch/domain/permission/location_permission_handler.dart';
import 'package:clean_arch/domain/repository/location_repository.dart';
import 'package:clean_arch/domain/repository/store_repository.dart';

class MockStoreRepositoryImpl implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Store(
        name: "name1",
        address: "address",
        latitude: 1,
        longitude: 1,
        remainStatus: "remainStatus",
      ),
      Store(
        name: "name2",
        address: "address",
        latitude: 3,
        longitude: 3,
        remainStatus: "remainStatus",
      ),
      Store(
        name: "name3",
        address: "address",
        latitude: 2,
        longitude: 2,
        remainStatus: "remainStatus",
      ),
    ];
  }
}

class MockLocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    return Location(latitude: 0, longitude: 0);
  }
}

class MockLocationPermissionHandler implements LocationPermissionHandler {
  @override
  Future<Permission> checkPermission() async {
    return Permission.always;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return true;
  }

  @override
  Future<Permission> requestPermission() async {
    return Permission.always;
  }
}
