import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/savings.dart';
import 'package:desafio_supremo/presentation/bloc/savings/savings_cubit.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetSavingsImpl mockGetSavings;
  late SavingsCubit statementCubit;

  setUp(() {
    mockGetSavings = MockGetSavingsImpl();
    statementCubit = SavingsCubit(mockGetSavings);
  });

  Savings tSavings = Savings(amount: 650);

  test(
    'initial state should be empty',
    () => expect(statementCubit.state, SavingsInitial()),
  );

  blocTest<SavingsCubit, SavingsState>(
    'should emit [success] when data is gotten successfully',
    build: () {
      when(mockGetSavings()).thenAnswer((_) async => Right(tSavings));
      return statementCubit;
    },
    act: (bloc) => bloc.getSavings(),
    wait: const Duration(milliseconds: 100),
    expect: () => [SavingsSuccess(tSavings)],
    verify: (bloc) => verify(mockGetSavings()),
  );

  blocTest<SavingsCubit, SavingsState>(
    'should emit [error] when get data is unsuccessful',
    build: () {
      when(mockGetSavings()).thenAnswer((_) async => Left(ServerFailure()));
      return statementCubit;
    },
    act: (bloc) => bloc.getSavings(),
    wait: const Duration(milliseconds: 100),
    expect: () => [isA<SavingsError>()],
    verify: (bloc) => verify(mockGetSavings()),
  );
}
