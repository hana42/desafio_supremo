import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/models/balance_model.dart';
import 'package:desafio_supremo/data/repositories/balance_repository_impl.dart';
import 'package:desafio_supremo/domain/entities/balance.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBalanceRemoteDataSourceImpl mockBalanceRemoteDataSource;
  late BalanceRepositoryImpl repository;

  const tBalanceModel = BalanceModel(amount: 1345);
  const tBalance = Balance(amount: 1345);

  setUp(() {
    mockBalanceRemoteDataSource = MockBalanceRemoteDataSourceImpl();
    repository = BalanceRepositoryImpl(mockBalanceRemoteDataSource);
  });

  group('get balance', () {
    test('returns a balance entity when a call to datasource is successful',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenAnswer((_) async => tBalanceModel);

      final result = await repository();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.right, equals(tBalance));
    });

    test('returns a server failure when a call to datasource is unsuccessful',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(ServerException());

      final result = await repository();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.left, isA<ServerFailure>());
    });

    test('returns data parsing failure when fails to decode json', () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(FormatException(''));

      final result = await repository();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.left, isA<DataParsingFailure>());
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(SocketException(''));

      final result = await repository();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.left, isA<ConnectionFailure>());
    });

    test('returns a unkown exception when another type of Exception is thrown',
        () async {
      when(mockBalanceRemoteDataSource.getBalance())
          .thenThrow(Exception(''));

      final result = await repository();

      verify(mockBalanceRemoteDataSource.getBalance());

      expect(result.left, isA<UnkownFailure>());
    });
  });
}
