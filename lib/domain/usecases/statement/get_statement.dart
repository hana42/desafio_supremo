import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/statement.dart';
import '../../repositories/statement_repository.dart';

class GetStatement {
  GetStatement(this._repository);
  final StatementRepository _repository;
  
  Future<Either<Failure, List<Statement>>> call(int limit, [int offset = 1]) {
    return _repository(limit, offset);
  }
}
