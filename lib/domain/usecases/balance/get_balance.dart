import 'package:either_dart/either.dart';

import '/core/error/failure.dart';
import '/domain/entities/balance.dart';

abstract class GetBalance {
  Future<Either<Failure, Balance>> call();
}
