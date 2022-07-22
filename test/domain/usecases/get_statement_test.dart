import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/domain/usecases/get_statement.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockStatementRepository mockStatementRepository;
  late GetStatement usecase;

  setUp(() {
    mockStatementRepository = MockStatementRepository();
    usecase = GetStatement(mockStatementRepository);
  });

  Statement testStatement = Statement(
      createdAt: DateTime.parse('2020-10-22T03:00:00Z'),
      id: 'E79E0C9A-46AE-4DBA-82F5-D0BACC53F6CF',
      amount: 1807,
      to: 'Simba Bond',
      description: 'Transferência realizada',
      tType: 'TRANSFEROUT');

  test(
    'should get statement from the repository',
    () async {
      when(mockStatementRepository.getStatement('10', '1'))
          .thenAnswer((_) async => Right(testStatement));

      final result = await usecase.get('10', '1');

      expect(result, equals(Right(testStatement)));
    },
  );

  String limit = '10';
  String offset = '1';

  group('getStatement', () {
    test(
      'returns a Statement when successful',
      () async {
        when(mockStatementRepository.getStatement('10', '1'))
            .thenAnswer((_) async => Right(testStatement));

        final result = await usecase.get(limit, offset);

        expect(result.isRight, true);
        expect(result.right, isA<Statement>());
      },
    );

    test(
      'throws an exception when server fails',
      () async {
        when(mockStatementRepository.getStatement('10', '1'))
            .thenAnswer((_) async => const Left(ServerFailure('Not Found')));

        final result = await usecase.get(limit, offset);

        expect(result.isLeft, true);
        expect(result.left, isA<Failure>());
      },
    );

    test(
      'throws an exception when connection fails',
      () async {
        when(mockStatementRepository.getStatement('10', '1')).thenAnswer(
            (_) async => const Left(ConnectionFailure('No connection')));

        final result = await usecase.get(limit, offset);

        expect(result.isLeft, true);
        expect(result.left, isA<Failure>());
      },
    );
  });
}
