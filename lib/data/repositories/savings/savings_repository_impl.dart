import 'dart:io';

import 'package:either_dart/either.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/savings.dart';
import '../../../domain/repositories/savings/savings_repository.dart';
import '../../datasources/savings/savings_local_data_source_impl.dart';

class SavingsRepositoryImpl implements SavingsRepository {
  SavingsRepositoryImpl(this._savingsLocalDataSource);
  final SavingsLocalDataSourceImpl _savingsLocalDataSource;

  @override
  Future<Either<Failure, Savings>> call() async {
    try {
      final result = await _savingsLocalDataSource.getSavings();
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } on FormatException {
      return Left(DataParsingFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (error) {
      return Left(UnkownFailure());
    }
  }
}
