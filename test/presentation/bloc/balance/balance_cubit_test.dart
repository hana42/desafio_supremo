import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/balance.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_cubit.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetBalanceImpl mockGetBalance;
  late BalanceCubit balanceCubit;

  setUp(() {
    mockGetBalance = MockGetBalanceImpl();
    balanceCubit = BalanceCubit(mockGetBalance);
  });

  const tBalance = Balance(amount: 1345);

  test(
    'initial state should be empty',
    () => expect(balanceCubit.state, BalanceInitial()),
  );

  blocTest<BalanceCubit, BalanceState>(
    'should emit [success] when data is gotten successfully',
    build: () {
      when(mockGetBalance()).thenAnswer((_) async => Right(tBalance));
      return balanceCubit;
    },
    act: (bloc) => bloc.getBalance(),
    wait: const Duration(milliseconds: 100),
    expect: () => [BalanceSuccess(tBalance)],
    verify: (bloc) => verify(mockGetBalance()),
  );

  blocTest<BalanceCubit, BalanceState>(
    'should emit [error] when get data is unsuccessful',
    build: () {
      when(mockGetBalance()).thenAnswer((_) async => Left(ServerFailure()));
      return balanceCubit;
    },
    act: (bloc) => bloc.getBalance(),
    wait: const Duration(milliseconds: 100),
    expect: () => [isA<BalanceError>()],
    verify: (bloc) => verify(mockGetBalance()),
  );
}
