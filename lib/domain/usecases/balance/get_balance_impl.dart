import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/balance.dart';
import '../../repositories/balance_repository.dart';

import 'get_balance.dart';

class GetBalanceImpl implements GetBalance {
  GetBalanceImpl(this._repository);
  final BalanceRepository _repository;

  @override
  Future<Either<Failure, Balance>> call() {
    return _repository();
  }
}
