import 'dart:async';

import 'package:either_dart/either.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/balance.dart';
import '../../domain/repositories/balance_repository.dart';
import '../datasources/balance/balance_remote_data_source_impl.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  BalanceRepositoryImpl(this.balanceRemoteDataSource);
  final BalanceRemoteDataSourceImpl balanceRemoteDataSource;

  @override
  Future<Either<Failure, Balance>> call() async {
    try {
      final result = await balanceRemoteDataSource.getBalance();
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    }
  }
}
