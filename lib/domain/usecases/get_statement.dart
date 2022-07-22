import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/statement.dart';
import '../repositories/statement_repository.dart';

class GetStatement {
  final StatementRepository repository;
  GetStatement(this.repository);

  Future<Either<Failure, Statement>> get(String limit, String offset) {
    return repository.getStatement(limit, offset);
  }
}