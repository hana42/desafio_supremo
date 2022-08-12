import 'package:desafio_supremo/data/datasources/goal_local_data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:desafio_supremo/data/models/goal_model.dart';
// import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/usecases/add_goal.dart';
import 'package:desafio_supremo/domain/usecases/get_goal.dart';
import 'package:desafio_supremo/domain/usecases/remove_goal.dart';
import 'package:desafio_supremo/domain/usecases/update_goal.dart';

part 'goals_state.dart';

class GoalCubit extends HydratedCubit<GoalState> {
  GoalCubit(
    this.getGoal,
    this.addGoal,
    this.updateGoal,
    this.removeGoal,
  ) : super(GoalLoaded(getGoal.get()));

  final GetGoal getGoal;
  final AddGoal addGoal;
  final UpdateGoal updateGoal;
  final RemoveGoal removeGoal;

  get() {
    final updatedGoalList = getGoal.get();
    emit(GoalLoaded(updatedGoalList));
  }

  add(String title, String? description, double goal,
      [bool completed = false]) {
    final updatedGoalList = addGoal.addGoal(
      title,
      description,
      goal,
      completed,
    );
    emit(GoalLoaded(updatedGoalList));
  }

  remove(String title) {
    final updatedGoalList = removeGoal.removeGoal(title);
    emit(GoalLoaded(updatedGoalList));
  }

  update(String title) {
    final updatedGoalList = updateGoal.updateGoal(title);
    emit(GoalLoaded(updatedGoalList));
  }

  @override
  GoalState? fromJson(Map<String, dynamic> json) {
    try {
      final List<GoalModel> listOfGoal = (json['goals'] as List)
          .map((e) => GoalModel.fromJson(e as Map<String, dynamic>))
          .toList();

      GoalLocalDataSourceImpl().goalList = listOfGoal;
      return GoalLoaded(listOfGoal);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(GoalState state) {
    return state is GoalLoaded ? state.toJson() : null;
  }
}
