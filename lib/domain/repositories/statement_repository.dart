import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/statement.dart';

abstract class StatementRepository {
  Future<Either<Failure, List<Statement>>> getStatement(String limit, String offset);
}
