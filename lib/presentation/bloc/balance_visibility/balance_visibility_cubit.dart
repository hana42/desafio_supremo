import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/data/datasources/balance_visibility/balance_visibility_local_data_source_impl.dart';
import 'package:desafio_supremo/domain/usecases/balance_visibility/get_balance_visibility_impl.dart';

import '../../../domain/usecases/balance_visibility/save_balance_visibility_impl.dart';

class BalanceVisibilityCubit extends Cubit<bool> {
  BalanceVisibilityCubit(
    this._getBalanceVisibility,
    this._saveBalanceVisibility, this._dataSource,
  ) : super(true);
  final GetBalanceVisibilityImpl _getBalanceVisibility;
  final SaveBalanceVisibilityImpl _saveBalanceVisibility;
  final BalanceVisibilityLocalDataSourceImpl _dataSource;

  bool initialState = false;

  void get() async {
    final result = await _dataSource.get();
    initialState = result;
    print(' get() $initialState');
    emit(initialState);
  }

  void changeVisibility() async {
    initialState = !state;
    print(' set() $initialState');
    final result = await _dataSource.post(initialState);
    emit(initialState);
  }
}
