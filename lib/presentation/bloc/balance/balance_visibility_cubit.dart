import 'package:hydrated_bloc/hydrated_bloc.dart';

class BalanceVisibilityCubit extends HydratedCubit<bool> {
  BalanceVisibilityCubit() : super(true);
  bool isVisible = true;

  changeVisibility() {
    emit(!isVisible);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) => json['isVisible'] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {'isVisible': state};
}
