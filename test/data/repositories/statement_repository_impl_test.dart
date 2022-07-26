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

  const String limit = '10';
  const String offset = '1';

  setUp(() {
    mockStatementRemoteDataSource = MockStatementRemoteDataSourceImpl();
    repository = StatementRepositoryImpl(
        statementRemoteDataSource: mockStatementRemoteDataSource);
  });

  group('get current statement', () {
    test('returns current statement when a call to datasource is successful',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenAnswer((_) async => [tStatementModel]);

      final result = await repository.getStatement(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.isRight, true);
      expect(result.right, equals([tStatement]));
    });

    test('returns server failure when a call to data source is unsuccessful',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(ServerException());

      final result = await repository.getStatement(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.isLeft, true);
      expect(result.left, equals(const ServerFailure('')));
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockStatementRemoteDataSource.getStatement(limit, offset))
          .thenThrow(const SocketException('Connection failed'));

      final result = await repository.getStatement(limit, offset);

      verify(mockStatementRemoteDataSource.getStatement(limit, offset));

      expect(result.isLeft, true);
      expect(result.left, equals(const ConnectionFailure('Connection failed')));
    });
  });
}
