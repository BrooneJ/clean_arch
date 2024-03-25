import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String name,
    required String address,
    required num latitude,
    required num longitude,
    @Default(0.0) num distance,
    required String remainStatus,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
