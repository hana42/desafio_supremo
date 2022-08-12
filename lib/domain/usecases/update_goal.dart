// import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/data/models/goal_model.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class UpdateGoal {
  final GoalRepository repository;
  UpdateGoal(this.repository);

  List<GoalModel> updateGoal(String title) {
    return repository.updateGoal(title);
  }
}
