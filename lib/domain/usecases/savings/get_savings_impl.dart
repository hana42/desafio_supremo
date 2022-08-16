import 'package:either_dart/either.dart';

import 'get_savings.dart';

import '../../../core/error/failure.dart';
import '../../entities/savings.dart';
import '../../repositories/savings/savings_repository.dart';

class GetSavingsImpl implements GetSavings {
  GetSavingsImpl(this._repository);
  final SavingsRepository _repository;

  @override
  Future<Either<Failure, Savings>> call() {
    return _repository();
  }
}
