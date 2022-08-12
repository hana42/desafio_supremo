import 'package:desafio_supremo/domain/entities/savings.dart';
import 'package:desafio_supremo/domain/repositories/savings_repository.dart';

class GetSavings {
  final SavingsRepository repository;
  GetSavings(this.repository);

  Savings get() {
    return repository.getSavings();
  }
}
