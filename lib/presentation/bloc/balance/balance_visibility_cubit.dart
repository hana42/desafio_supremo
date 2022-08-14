import 'package:bloc/bloc.dart';

class BalanceVisibilityCubit extends Cubit<bool> {
  BalanceVisibilityCubit() : super(true);
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    emit(isVisible);
  }
}
