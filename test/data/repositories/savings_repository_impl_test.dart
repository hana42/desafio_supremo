import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/models/savings/savings_model.dart';
import 'package:desafio_supremo/data/repositories/savings/savings_repository_impl.dart';
import 'package:desafio_supremo/domain/entities/savings.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSavingsLocalDataSourceImpl mockSavingsLocalDataSource;
  late SavingsRepositoryImpl repository;

  var tSavingsModel = SavingsModel(amount: 650);
  var tSavings = Savings(amount: 650);

  setUp(() {
    mockSavingsLocalDataSource = MockSavingsLocalDataSourceImpl();
    repository = SavingsRepositoryImpl(mockSavingsLocalDataSource);
  });

  group('get savings', () {
    test('returns a Savings when a call to datasource is successful', () async {
      when(mockSavingsLocalDataSource.getSavings())
          .thenAnswer((_) async => tSavingsModel);

      final result = await repository();

      verify(mockSavingsLocalDataSource.getSavings());

      expect(result.isRight, true);
      expect(result.right, equals(tSavings));
    });

    test('returns a server failure when a call to datasource is unsuccessful',
        () async {
      when(mockSavingsLocalDataSource.getSavings())
          .thenThrow(ServerException());

      final result = await repository();

      verify(mockSavingsLocalDataSource.getSavings());

      expect(result.left, isA<ServerFailure>());
    });

    test('returns data parsing failure when fails to decode json', () async {
      when(mockSavingsLocalDataSource.getSavings())
          .thenThrow(FormatException(''));

      final result = await repository();

      verify(mockSavingsLocalDataSource.getSavings());

      expect(result.left, isA<DataParsingFailure>());
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockSavingsLocalDataSource.getSavings())
          .thenThrow(const SocketException(''));

      final result = await repository();

      verify(mockSavingsLocalDataSource.getSavings());

      expect(result.left, isA<ConnectionFailure>());
    });

    test('returns a unkown failure when another type of Exception is thrown',
        () async {
      when(mockSavingsLocalDataSource.getSavings()).thenThrow(Exception(''));

      final result = await repository();

      verify(mockSavingsLocalDataSource.getSavings());

      expect(result.left, isA<UnkownFailure>());
    });
  });
}
