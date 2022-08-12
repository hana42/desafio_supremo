import 'package:desafio_supremo/data/models/savings_model.dart';

abstract class SavingsLocalDataSource {
  SavingsModel getSavings();
}

class SavingsLocalDataSourceImpl implements SavingsLocalDataSource {
  SavingsLocalDataSourceImpl();
  SavingsModel savings = const SavingsModel(amount: 1000);

  @override
  SavingsModel getSavings() {
    return savings;
  }
}
