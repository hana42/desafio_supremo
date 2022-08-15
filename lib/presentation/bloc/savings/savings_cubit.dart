import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/savings.dart';
import '../../../domain/usecases/savings/get_savings_impl.dart';

part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit(this._getSavings) : super(SavingsInitial());
  final GetSavingsImpl _getSavings;

  void getSavings() async {
    final result = await _getSavings();
    
    result.fold(
      (left) => emit(SavingsError('Error')),
      (right) => emit(SavingsSuccess(right)),
    );
  }
}
