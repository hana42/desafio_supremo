import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class GetGoal {
  final GoalRepository repository;
  GetGoal(this.repository);

  List<Goal> goalList = [];

  List<Goal> get() {
    goalList = repository.getGoal();
    return goalList;
  }
}
