import '../../models/balance/balance_model.dart';

abstract class BalanceRemoteDataSource {
  Future<BalanceModel> getBalance();
}
