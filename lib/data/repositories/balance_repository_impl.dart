import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/balance.dart';
import '../../domain/repositories/balance_repository.dart';
import '../datasources/balance_remote_data_source.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final BalanceRemoteDataSource balanceRemoteDataSource;

  BalanceRepositoryImpl(this.balanceRemoteDataSource);

  @override
  Future<Either<Failure, Balance>> getBalance() async {
    try {
      final result = await balanceRemoteDataSource.getBalance();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
