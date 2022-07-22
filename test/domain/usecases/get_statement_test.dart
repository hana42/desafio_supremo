import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

      final result = await usecase.execute('10', '1');

      expect(result, equals(Right(testStatement)));
    },
  );
}
