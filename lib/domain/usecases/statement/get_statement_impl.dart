import 'package:either_dart/either.dart';

import '../../repositories/statement_repository.dart';

import '../../../core/error/failure.dart';
import '../../entities/statement.dart';

import 'get_statement.dart';

class GetStatementImpl implements GetStatement {
  GetStatementImpl(this._repository);
  final StatementRepository _repository;

  @override
  Future<Either<Failure, List<Statement>>> call(int limit, [int offset = 1]) {
    return _repository(limit, offset);
  }
}
