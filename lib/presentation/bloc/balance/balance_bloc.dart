import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_state.dart';

import '../../../domain/usecases/get_balance.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final GetBalance _getBalance;
  int amount = 0;

  BalanceBloc(this._getBalance) : super(BalanceInitial()) {
    on<FetchBalance>((event, emit) async {
      final result = await _getBalance.get();

      result.fold(
        (failure) {
          emit(BalanceError(failure.message));
        },
        (data) {
          amount = data.amount;
          emit(BalanceHasData(data));
        },
      );
    });
  }
}
