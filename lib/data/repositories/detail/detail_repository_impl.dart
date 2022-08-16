import 'dart:io';

import 'package:either_dart/either.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/detail.dart';
import '../../../domain/repositories/detail/detail_repository.dart';
import '../../datasources/detail/detail_remote_data_source.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl(this.detailRemoteDataSource);
  final DetailRemoteDataSource detailRemoteDataSource;

  @override
  Future<Either<Failure, Detail>> call(String id) async {
    try {
      final result = await detailRemoteDataSource.getDetail(id);
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
