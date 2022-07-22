import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/balance.dart';
import '../repositories/balance_repository.dart';

class GetBalance {
  final BalanceRepository repository;
  GetBalance(this.repository);

  Future<Either<Failure, Balance>> execute(int amount) {
    return repository.getBalance(amount);
  }
}
