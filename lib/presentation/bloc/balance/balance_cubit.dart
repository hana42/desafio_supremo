import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/domain/entities/balance.dart';

import '../../../domain/usecases/get_balance.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this._getBalance) : super(const BalanceInitial());

  final GetBalance _getBalance;

  void getBalance() async {
    final result = await _getBalance.get();

    result.fold(
      (failure) => emit(BalanceError(failure.message)),
      (data) => emit(BalanceSuccess(data)),
    );
  }
}
