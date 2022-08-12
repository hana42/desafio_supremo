import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class RemoveGoal {
  final GoalRepository repository;
  RemoveGoal(this.repository);

  List<Goal> removeGoal(title) {
    return repository.removeGoal(title);
  }
}
