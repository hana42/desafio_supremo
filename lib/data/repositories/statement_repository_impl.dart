import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/statement.dart';
import '../../domain/repositories/statement_repository.dart';
import '../datasources/statement_remote_data_source.dart';

class StatementRepositoryImpl implements StatementRepository {
  final StatementRemoteDataSource statementRemoteDataSource;

  StatementRepositoryImpl({required this.statementRemoteDataSource});

  @override

  Future<Either<Failure, List<Statement>>> getStatement(
      int limit, int offset) async {
    try {
      final result = await statementRemoteDataSource.getStatement(offset);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
