import 'package:either_dart/either.dart';

import 'package:desafio_supremo/domain/usecases/savings/get_savings.dart';

import '../../../core/error/failure.dart';
import '../../entities/savings.dart';
import '../../repositories/savings_repository.dart';

class GetSavingsImpl implements GetSavings {
  GetSavingsImpl(this._repository);
  final SavingsRepository _repository;

  @override
  Future<Either<Failure, Savings>> call() {
    return _repository();
  }
}
