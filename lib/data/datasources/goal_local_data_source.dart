import 'package:desafio_supremo/data/models/goal_model.dart';

abstract class GoalLocalDataSource {
  List<GoalModel> getGoals();
  List<GoalModel> addGoal(
    String title,
    String? description,
    double goal, [
    bool completed = false,
  ]);
  List<GoalModel> removeGoal(String title);
  List<GoalModel> updateGoal(String title);
}

class GoalLocalDataSourceImpl implements GoalLocalDataSource {
  GoalLocalDataSourceImpl();
  List<GoalModel> goalList = [];

  @override
  List<GoalModel> getGoals() {
    return goalList;
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
    goalList.add(goalItem);
    return goalList;
  }

  @override
  List<GoalModel> removeGoal(String title) {
    goalList.removeWhere((element) => element.title == title);
    return goalList;
  }

  @override
  List<GoalModel> updateGoal(String title) {
    for (GoalModel element in goalList) {
      if (element.title == title) {
        element.completed = !element.completed;
      }
    }
    return goalList;
  }
}
