import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/data/models/goal_model.dart';
import 'package:desafio_supremo/data/repositories/goals_repository_impl.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'goals_event.dart';
part 'goals_state.dart';

class SavingsBloc extends Bloc<SavingsEvent, SavingsState> with HydratedMixin {
  final SavingsRepository savingsRepository;

  SavingsBloc(this.savingsRepository)
      : super(SavingsLoaded(savingsRepository.savingsList)) {
    on<AddSavings>((event, emit) async {
      emit(SavingsLoading());
      final updatedSavingsList =
          savingsRepository.addSavings(event.todoTitle, '', 0, 0, false);
      emit(SavingsLoaded(updatedSavingsList));
    });
    on<RemoveSavings>((event, emit) {
      emit(SavingsLoading());
      final updatedSavingsList = savingsRepository.removeSavings(event.title);
      emit(SavingsLoaded(updatedSavingsList));
    });

    on<UpdateSavingsState>((event, emit) async {
      emit(SavingsLoading());
      final updatedSavingsList =
          savingsRepository.updateSavingsState(event.isCompleted, event.title);
      emit(SavingsLoaded(updatedSavingsList));
    });
  }

  @override
  SavingsState? fromJson(Map<String, dynamic> json) {
    try {
      final listOfSavings = (json['savings'] as List)
          .map((e) => Savings.fromJson(e as Map<String, dynamic>))
          .toList();

      savingsRepository.savingsList = listOfSavings;
      return SavingsLoaded(listOfSavings);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SavingsState state) {
    if (state is SavingsLoaded) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
