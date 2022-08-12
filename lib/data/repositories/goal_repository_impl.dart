import 'package:desafio_supremo/data/datasources/goal_local_data_source.dart';
import 'package:desafio_supremo/data/models/goal_model.dart';
import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  GoalRepositoryImpl(this.goalLocalDataSource);
  final GoalLocalDataSource goalLocalDataSource;

  @override
  List<Goal> getGoal() {
    List<GoalModel> goals = goalLocalDataSource.getGoals();
    return [
      for (var goal in goals) goal.toEntity(),
    ];
  }

  @override
  List<Goal> addGoal(
    String title,
    String? description,
    double goal, [
    bool completed = false,
  ]) {
    goalLocalDataSource.addGoal(title, description ?? '', goal, completed);
    return getGoal();
  }

  @override
  List<Goal> removeGoal(String title) {
    goalLocalDataSource.removeGoal(title);
    return getGoal();
  }

  @override
  List<Goal> updateGoal(String title) {
    goalLocalDataSource.updateGoal(title);
    return getGoal();
  }
}
