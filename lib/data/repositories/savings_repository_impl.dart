import 'package:desafio_supremo/data/datasources/savings_local_data_source.dart';
import 'package:desafio_supremo/domain/entities/savings.dart';
import 'package:desafio_supremo/domain/repositories/savings_repository.dart';

class SavingsRepositoryImpl implements SavingsRepository {
  SavingsRepositoryImpl(this.savingsLocalDataSource);
  final SavingsLocalDataSource savingsLocalDataSource;

  @override
  Savings getSavings() {
    return savingsLocalDataSource.getSavings().toEntity();
  }
}
