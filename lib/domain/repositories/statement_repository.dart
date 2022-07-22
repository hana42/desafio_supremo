import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/statement.dart';

abstract class StatementRepository {
  Future<Either<Failure, Statement>> getStatement(String limit, String offset);
}
