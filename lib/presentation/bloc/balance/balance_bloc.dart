import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/bloc/balance/balance_state.dart';

import '../../../domain/usecases/get_balance.dart';
import 'balance_event.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final GetBalance _getBalance;

  BalanceBloc(this._getBalance) : super(BalanceEmpty()) {
    on<FetchBalance>((event, emit) async {
      emit(BalanceLoading());

      final result = await _getBalance.get();
      result.fold(
        (failure) {
          emit(BalanceError(failure.message));
        },
        (data) {
          emit(BalanceHasData(data));
        },
      );
    });
  }
}
