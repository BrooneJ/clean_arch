import 'package:clean_arch/data/data_source/store_api.dart';
import 'package:clean_arch/domain/model/store.dart';
import 'package:clean_arch/domain/repository/store_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Singleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final _api = StoreApi();

  @override
  Future<List<Store>> getStores() async {
    final result = await _api.getStoreResult();

    return result.stores!
        .where((e) {
          return e.stockAt != null;
        })
        .map((e) => Store(
              name: e.name ?? "",
              address: e.addr ?? "",
              latitude: e.lat ?? 0.0,
              longitude: e.lng ?? 0.0,
              remainStatus: e.remainStat ?? "",
            ))
        .toList();
  }
}
