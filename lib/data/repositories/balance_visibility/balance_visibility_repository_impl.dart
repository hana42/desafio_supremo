import 'package:either_dart/either.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../domain/repositories/balance_visibility/balance_visibility_repository.dart';
import '../../datasources/balance_visibility/balance_visibility_local_data_source.dart';

class BalanceVisibilityRepositoryImpl implements BalanceVisibilityRepository {
  BalanceVisibilityRepositoryImpl(this.localDataSource);
  final BalanceVisibilityLocalDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> getBalanceVisibility() async {
    final result = localDataSource.get();
    return Right(result);
  }

  @override
  Future<Either<Failure, bool>> save(bool isVisible) async {
    try {
      final result = await localDataSource.post(isVisible);
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
