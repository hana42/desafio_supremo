import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';

abstract class BalanceVisibilityRepository {
  Future<Either<Failure, bool>> getBalanceVisibility();
  Future<Either<Failure, bool>> save(bool isVisible);
}
