import 'package:desafio_supremo/domain/entities/goal.dart';

abstract class GoalRepository {
  List<Goal> getGoal();

  List<Goal> addGoal(
    String title,
    String? description,
    double goal, [
    bool completed = false,
  ]);

  List<Goal> removeGoal(String title);

  List<Goal> updateGoal(String title);
}
