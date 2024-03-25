import 'package:collection/collection.dart';

import 'store.dart';

class StoreResultDto {
  final int? count;
  final List<Store>? stores;

  const StoreResultDto({this.count, this.stores});

  factory StoreResultDto.fromJson(Map<String, dynamic> json) {
    return StoreResultDto(
      count: json['count'] as int?,
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'stores': stores?.map((e) => e.toJson()).toList(),
      };
}
