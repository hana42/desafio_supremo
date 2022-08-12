import 'package:desafio_supremo/data/models/goal_model.dart';
// import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';

class GetGoal {
  final GoalRepository repository;
  GetGoal(this.repository);

  List<GoalModel> get() {
    return repository.getGoal();
  }
}
