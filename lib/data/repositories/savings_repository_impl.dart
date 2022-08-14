import '../../domain/entities/savings.dart';
import '../../domain/repositories/savings_repository.dart';
import '../datasources/savings_local_data_source.dart';

class SavingsRepositoryImpl implements SavingsRepository {
  SavingsRepositoryImpl(this.savingsLocalDataSource);
  final SavingsLocalDataSource savingsLocalDataSource;

  @override
  Savings call() {
    return savingsLocalDataSource.getSavings().toEntity();
  }
}
