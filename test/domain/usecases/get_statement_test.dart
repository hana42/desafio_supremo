import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/domain/usecases/statement/get_statement_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockStatementRepository mockStatementRepository;
  late GetStatementImpl usecase;

  setUp(() {
    mockStatementRepository = MockStatementRepository();
    usecase = GetStatementImpl(mockStatementRepository);
  });

  int limit = 10;
  int offset = 1;

  Statement tStatement = Statement(
    createdAt: DateTime.parse('2020-10-22T03:00:00Z'),
    id: 'E79E0C9A-46AE-4DBA-82F5-D0BACC53F6CF',
    amount: 1807,
    to: 'Simba Bond',
    description: 'Transferência realizada',
    tType: 'TRANSFEROUT',
  );

  group('getStatement', () {
    test('returns a Statement when successful', () async {
      when(mockStatementRepository(limit, offset))
          .thenAnswer((_) async => Right([tStatement]));

      final result = await usecase(limit, offset);

      expect(result.isRight, true);
      expect(result.right, isA<List<Statement>>());
      expect(result.right, equals([tStatement]));
    });
  });
}
