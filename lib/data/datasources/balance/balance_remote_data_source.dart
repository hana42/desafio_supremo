import '../../models/balance_model.dart';

abstract class BalanceRemoteDataSource {
  Future<BalanceModel> getBalance();
}
