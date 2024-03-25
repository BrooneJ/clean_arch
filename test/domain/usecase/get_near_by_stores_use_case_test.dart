import 'package:clean_arch/data/mock_data.dart';
import 'package:clean_arch/domain/usecase/get_near_by_stores_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final useCase = GetNearByStoresUseCase(
    storeRepository: MockStoreRepositoryImpl(),
    locationRepository: MockLocationRepositoryImpl(),
    locationPermissionHandler: MockLocationPermissionHandler(),
  );

  test('ascending order', () async {
    final stores = await useCase.execute();

    expect(stores[0].name, "name1");
    expect(stores[1].name, "name3");
    expect(stores[2].name, "name2");
  });
}
