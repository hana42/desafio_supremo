import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/models/statement_model.dart';
import 'package:desafio_supremo/data/repositories/statement_repository_impl.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockStatementRemoteDataSourceImpl mockStatementRemoteDataSource;
  late StatementRepositoryImpl repository;

  var tStatementModel = StatementModel(
    createdAt: DateTime.parse('2020-11-26T03:00:00Z'),
    bankName: 'Bank XPTO',
    id: 'BAF91302-3E25-4E5E-89A6-0F6CD4BEC5B6',
    description: 'Transferência PIX recebida',
    amount: 1674,
    from: 'Tiago Windu',
    tType: 'PIXCASHIN',
  );

  var tStatement = Statement(
    createdAt: DateTime.parse('2020-11-26T03:00:00Z'),
    bankName: 'Bank XPTO',
    id: 'BAF91302-3E25-4E5E-89A6-0F6CD4BEC5B6',
    description: 'Transferência PIX recebida',
    amount: 1674,
    from: 'Tiago Windu',
    tType: 'PIXCASHIN',
  );

  const int limit = 10;
  const int offset = 1;

  setUp(() {
    mockStatementRemoteDataSource = MockStatementRemoteDataSourceImpl();
    repository = StatementRepositoryImpl(mockStatementRemoteDataSource);
  });

  group('get statement', () {
    test('returns a list of statement when a call to datasource is successful',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenAnswer((_) async => [tStatementModel]);

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.right, equals([tStatement]));
    });

    test('returns a server failure when a call to datasource is unsuccessful',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(ServerException());

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.left, equals(const ServerFailure()));
    });

    test('returns data parsing failure when fails to decode json', () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(FormatException(''));

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.left, equals(const DataParsingFailure()));
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(const SocketException(''));

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.left, equals(const ConnectionFailure()));
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(const SocketException(''));

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.left, equals(const ConnectionFailure()));
    });

    test('returns a unkown failure when another type of Exception is thrown',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(Exception(''));

      final result = await repository(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.left, equals(const UnkownFailure()));
    });
  });
}
