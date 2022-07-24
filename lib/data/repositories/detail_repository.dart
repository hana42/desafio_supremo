import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/detail.dart';
import '../../domain/repositories/detail_repository.dart';
import '../datasources/detail_remote_data_source.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource balanceRemoteDataSource;

  DetailRepositoryImpl({required this.balanceRemoteDataSource});

  @override
  Future<Either<Failure, Detail>> getDetail(String id) async {
    try {
      final result = await balanceRemoteDataSource.getDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
