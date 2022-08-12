import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class AddGoal {
  final GoalRepository repository;
  AddGoal(this.repository);

  List<Goal> addGoal(String title, String? description, double goal, [bool completed = false]) {
    return repository.addGoal(title, description ?? '', goal, completed);
  }
}
