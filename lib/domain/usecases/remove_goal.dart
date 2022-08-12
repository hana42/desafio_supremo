import 'package:desafio_supremo/data/models/goal_model.dart';
// import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class RemoveGoal {
  final GoalRepository repository;
  RemoveGoal(this.repository);

  List<GoalModel> removeGoal(String title) {
    return repository.removeGoal(title);
  }
}
