import 'package:desafio_supremo/data/models/goal_model.dart';

abstract class GoalLocalDataSource {
  List<GoalModel> getGoals();
}

class GoalLocalDataSourceImpl implements GoalLocalDataSource {
  GoalLocalDataSourceImpl();
  List<GoalModel> goalList = [];

  @override
  List<GoalModel> getGoals() {
    return goalList;
  }
}
