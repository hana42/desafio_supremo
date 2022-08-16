import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';

import '../../../domain/entities/balance.dart';
import '../../../domain/usecases/balance/get_balance_impl.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this._getBalance) : super(const BalanceInitial());
  final GetBalanceImpl _getBalance;

  void getBalance() async {
    final result = await _getBalance();

    result.fold(
      (failure) => emit(BalanceError(failure)),
      (data) => emit(BalanceSuccess(data)),
    );
  }
}
