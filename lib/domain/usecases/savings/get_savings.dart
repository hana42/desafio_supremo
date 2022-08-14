import '../../entities/savings.dart';
import '../../repositories/savings_repository.dart';

class GetSavings {
  GetSavings(this._repository);
  final SavingsRepository _repository;

  Savings call() {
    return _repository();
  }
}
