import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsVisibilityBloc extends Cubit<bool> {
  SavingsVisibilityBloc() : super(true);

  bool initialState = true;

  changeVisibility() {
    initialState = !initialState;
    emit(initialState);
  }
}
