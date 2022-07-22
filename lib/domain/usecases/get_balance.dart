import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/balance.dart';
import '../repositories/balance_repository.dart';

class GetBalance {
  final BalanceRepository repository;
  GetBalance(this.repository);

  Future<Either<Failure, Balance>> get() {
    return repository.getBalance();
  }
}
