import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/balance.dart';

abstract class BalanceRepository {
  Future<Either<Failure, Balance>> getBalance(int amount);
}
