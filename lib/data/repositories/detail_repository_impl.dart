import 'dart:io';

import 'package:either_dart/either.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/datasources/detail_remote_data_source.dart';
import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl(this.detailRemoteDataSource);
  final DetailRemoteDataSource detailRemoteDataSource;

  @override
  Future<Either<Failure, Detail>> getDetail(String id) async {
    try {
      final result = await detailRemoteDataSource.getDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
