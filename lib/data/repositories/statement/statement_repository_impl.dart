import 'dart:io';

import 'package:either_dart/either.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/statement.dart';
import '../../../domain/repositories/statement/statement_repository.dart';
import '../../datasources/statement/statement_remote_data_source.dart';

class StatementRepositoryImpl implements StatementRepository {
  StatementRepositoryImpl(this.statementRemoteDataSource);
  final StatementRemoteDataSource statementRemoteDataSource;

  @override
  Future<Either<Failure, List<Statement>>> call(int limit, int offset) async {
    try {
      final result =
          await statementRemoteDataSource.getStatement(limit, offset);
      return Right(result.map((e) => e.toEntity()).toList());
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