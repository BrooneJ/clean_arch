import 'package:clean_arch/domain/model/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    @Default([]) List<Store> stores,
    @Default(false) bool isLoading,
  }) = _MainState;

  factory MainState.fromJson(Map<String, dynamic> json) =>
      _$MainStateFromJson(json);
}
