import 'package:desafio_supremo/data/models/goal_model.dart';
// import 'package:desafio_supremo/domain/entities/goal.dart';

abstract class GoalRepository {
  List<GoalModel> getGoal();

  List<GoalModel> addGoal(
    String title,
    String? description,
    double goal, [
    bool completed = false,
  ]);

  List<GoalModel> removeGoal(String title);

  List<GoalModel> updateGoal(String title);
}
