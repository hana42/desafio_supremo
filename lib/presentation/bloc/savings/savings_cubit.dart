import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/domain/entities/savings.dart';
import 'package:desafio_supremo/domain/usecases/get_savings.dart';

part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit(this._getSavings) : super(SavingsInitial());
  final GetSavings _getSavings;

  void getSavings() {
    final Savings result = _getSavings.get();
    emit(SavingsSuccess(result));
  }
}
