import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../repositories/balance_visibility_repository.dart';

class GetBalanceVisibilityImpl implements GetBalanceVisibility {
  GetBalanceVisibilityImpl(this._repository);
  final BalanceVisibilityRepository _repository;

  @override
  Future<Either<Failure, bool>> call() async {
    return await _repository.getBalanceVisibility();
  }
}

abstract class GetBalanceVisibility {
  Future<Either<Failure, bool>> call();
}
