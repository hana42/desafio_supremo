import 'package:bloc/bloc.dart';

import '../../../domain/usecases/balance_visibility/get_balance_visibility_impl.dart';

import '../../../domain/usecases/balance_visibility/save_balance_visibility_impl.dart';

class BalanceVisibilityCubit extends Cubit<bool> {
  BalanceVisibilityCubit(
    this._getBalanceVisibility,
    this._saveBalanceVisibility,
  ) : super(false);
  final GetBalanceVisibilityImpl _getBalanceVisibility;
  final SaveBalanceVisibilityImpl _saveBalanceVisibility;

  bool isVisible = false;

  void get() async {
    final result = await _getBalanceVisibility();
    isVisible = result.right;
    emit(isVisible);
  }

  void changeVisibility() async {
    isVisible = !state;
    await _saveBalanceVisibility(isVisible);
    emit(isVisible);
  }
}
