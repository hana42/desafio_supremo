import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/statement.dart';
import '../repositories/statement_repository.dart';

class GetStatement {
  final StatementRepository repository;
  GetStatement(this.repository);
  Future<Either<Failure, List<Statement>>> get(int limit, [int offset = 1]) {
    return repository.getStatement(limit, offset);
  }
}
