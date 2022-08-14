import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/savings.dart';
import '../../../domain/usecases/savings/get_savings.dart';

part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit(this._getSavings) : super(SavingsInitial());
  final GetSavings _getSavings;

  void getSavings() {
    final Savings result = _getSavings();
    emit(SavingsSuccess(result));
  }
}
