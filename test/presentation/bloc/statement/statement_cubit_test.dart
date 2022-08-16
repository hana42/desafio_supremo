import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_cubit.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetStatementImpl mockGetStatement;
  late StatementCubit statementCubit;

  setUp(() {
    mockGetStatement = MockGetStatementImpl();
    statementCubit = StatementCubit(mockGetStatement);
  });

  const int limit = 10;
  const int offset = 1;

  Statement tStatement = Statement(
    createdAt: DateTime.parse('2020-10-22T03:00:00Z'),
    id: 'E79E0C9A-46AE-4DBA-82F5-D0BACC53F6CF',
    amount: 1807,
    to: 'Simba Bond',
    description: 'Transferência realizada',
    tType: 'TRANSFEROUT',
  );

  test(
    'initial state should be empty',
    () {
      expect(statementCubit.state, StatementInitial());
    },
  );

  blocTest<StatementCubit, StatementState>(
    'should emit [success] when data is gotten successfully',
    build: () {
      when(mockGetStatement(limit))
          .thenAnswer((_) async => Right([tStatement]));
      return statementCubit;
    },
    act: (bloc) => bloc.getStatement(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      StatementSuccess(statements: [tStatement]),
    ],
    verify: (bloc) {
      verify(mockGetStatement(limit));
    },
  );

  blocTest<StatementCubit, StatementState>(
    'should emit [error] when get data is unsuccessful',
    build: () {
      when(mockGetStatement(limit))
          .thenAnswer((_) async => Left(ServerFailure()));
      return statementCubit;
    },
    act: (bloc) => bloc.getStatement(),
    wait: const Duration(milliseconds: 100),
    expect: () => [isA<StatementError>()],
    verify: (bloc) => verify(mockGetStatement(limit)),
  );
}
