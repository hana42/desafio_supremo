import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/models/balance_model.dart';
import 'package:desafio_supremo/data/repositories/balance_repository.dart';
import 'package:desafio_supremo/domain/entities/balance.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockBalanceRemoteDataSource mockBalanceRemoteDataSource;
  late BalanceRepositoryImpl repository;

  const tBalanceModel = BalanceModel(amount: 1345);
  const tBalance = Balance(amount: 1345);

  setUp(() {
    mockBalanceRemoteDataSource = MockBalanceRemoteDataSource();
    repository = BalanceRepositoryImpl(
        balanceRemoteDataSource: mockBalanceRemoteDataSource);
  });

  group('get current balance', () {
    test('returns current balance when a call to datasource is successful',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenAnswer((_) async => tBalanceModel);

      final result = await repository.getBalance();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.isRight, true);
      expect(result.right, equals(tBalance));
    });

    test('returns server failure when a call to data source is unsuccessful',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(ServerException());

      final result = await repository.getBalance();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.isLeft, true);
      expect(result.left, equals(const ServerFailure('')));
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(const SocketException('Connection failed'));

      final result = await repository.getBalance();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.isLeft, true);
      expect(result.left, equals(const ConnectionFailure('Connection failed')));
    });
  });
}