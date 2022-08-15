import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/statement.dart';

abstract class GetStatement {
  Future<Either<Failure, List<Statement>>> call(int limit, [int offset = 1]);
}
