import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/statement.dart';

abstract class StatementRepository {
  Future<Either<Failure, List<Statement>>> getStatement(int limit, int offset);
}
