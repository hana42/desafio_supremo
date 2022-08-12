import 'package:desafio_supremo/data/datasources/goal_local_data_source.dart';
import 'package:desafio_supremo/data/models/goal_model.dart';
// import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  GoalRepositoryImpl(this.goalLocalDataSource);
  final GoalLocalDataSourceImpl goalLocalDataSource;

  @override
  List<GoalModel> getGoal() {
    List<GoalModel> goals = goalLocalDataSource.getGoals();
    return goals;
  }

  @override
  List<GoalModel> addGoal(
    String title,
    String? description,
    double goal, [
    bool completed = false,
  ]) {
    final GoalModel goalItem = GoalModel(
      title,
      description ?? '',
      goal,
      completed: completed,
    );
    goalLocalDataSource.goalList.add(goalItem);
    return getGoal();
  }

  @override
  List<GoalModel> removeGoal(String title) {
    goalLocalDataSource.goalList.removeWhere((e) => e.title == title);
    return getGoal();
  }

  @override
  List<GoalModel> updateGoal(String title) {
    for (GoalModel e in goalLocalDataSource.goalList) {
      if (e.title == title) {
        e.completed = !e.completed;
      }
    }
    return getGoal();
  }
}
