import '../../models/savings/savings_model.dart';

abstract class SavingsLocalDataSource {
  Future<SavingsModel> getSavings();
}
