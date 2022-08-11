import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceVisibilityBloc extends Cubit<bool> {
  BalanceVisibilityBloc() : super(true);

  bool initialState = true;

  changeVisibility() {
    initialState = !initialState;
    emit(initialState);
  }
}
