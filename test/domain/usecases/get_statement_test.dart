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

  String limit = '10';
  String offset = '1';

  Statement testStatement = Statement(
    createdAt: DateTime.parse('2020-10-22T03:00:00Z'),
    id: 'E79E0C9A-46AE-4DBA-82F5-D0BACC53F6CF',
    amount: 1807,
    to: 'Simba Bond',
    description: 'Transferência realizada',
    tType: 'TRANSFEROUT',
  );

  group('getStatement', () {
    test('returns a Statement when successful', () async {
      when(mockStatementRepository.getStatement(limit, offset))
          .thenAnswer((_) async => Right([testStatement]));

      final result = await usecase.get(limit, offset);

      expect(result.isRight, true);
      expect(result.right, isA<List<Statement>>());
      expect(result.right, equals([testStatement]));
    });

    test('throws an exception when server fails', () async {
      when(mockStatementRepository.getStatement(limit, offset))
          .thenAnswer((_) async => const Left(ServerFailure('Not Found')));

      final result = await usecase.get(limit, offset);

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left, isA<ServerFailure>());
    });

    test('throws an exception when connection fails', () async {
      when(mockStatementRepository.getStatement(limit, offset)).thenAnswer(
          (_) async => const Left(ConnectionFailure('No connection')));

      final result = await usecase.get(limit, offset);

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left, isA<ConnectionFailure>());
    });
  });
}
