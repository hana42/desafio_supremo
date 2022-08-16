import 'package:either_dart/either.dart';

import '/domain/entities/balance.dart';
import '../../../core/error/failure.dart';

abstract class GetBalance {
  Future<Either<Failure, Balance>> call();
}
