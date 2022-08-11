import 'package:desafio_supremo/presentation/bloc/savings/savings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsBloc extends Cubit<SavingsState> {
  final GetSavings _getSavings;
  int amount = 0;

  SavingsBloc(this._getSavings) : super(SavingsInitial()) {
    void fetchSavings() async {
      final result = await _getSavings.get();

      result.fold(
        (failure) {
          emit(SavingsError(failure.message));
        },
        (data) {
          amount = data.amount;
          emit(SavingsHasData(data));
        },
      );
    }
  }
}
