import 'package:clean_arch/domain/usecase/get_near_by_stores_use_case.dart';
import 'package:clean_arch/presentation/main_state.dart';
import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  final GetNearByStoresUseCase _getNearByStoresUseCase;

  MainState _state = MainState();
  MainState get state => _state;

  MainViewModel(this._getNearByStoresUseCase) {
    getStores();
  }

  Future<void> getStores() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      stores: await _getNearByStoresUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }
}
