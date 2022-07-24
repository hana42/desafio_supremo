import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/statement.dart';
import '../../domain/repositories/statement_repository.dart';
import '../datasources/statement_remote_data_source.dart';

class StatementRepositoryImpl implements StatementRepository {
  final StatementRemoteDataSource balanceRemoteDataSource;

  StatementRepositoryImpl({required this.balanceRemoteDataSource});

  @override
  Future<Either<Failure, List<Statement>>> getStatement(
      String limit, String offset) async {
    try {
      final result = await balanceRemoteDataSource.getStatement(limit, offset);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
