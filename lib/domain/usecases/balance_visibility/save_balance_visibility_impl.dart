import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../repositories/balance_visibility_repository.dart';

class SaveBalanceVisibilityImpl implements SaveBalanceVisibility {
  SaveBalanceVisibilityImpl(this._repository);
  final BalanceVisibilityRepository _repository;

  @override
  Future<Either<Failure, bool>> call(bool isVisible) {
    return _repository.save(isVisible);
  }
}

abstract class SaveBalanceVisibility {
  Future<Either<Failure, bool>> call(bool isVisible);
}
