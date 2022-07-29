// import 'package:bloc_test/bloc_test.dart';
// import 'package:either_dart/either.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'package:desafio_supremo/core/error/failure.dart';
// import 'package:desafio_supremo/domain/entities/balance.dart';
// import 'package:desafio_supremo/domain/usecases/get_balance.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_bloc.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_state.dart';

// import 'balance_bloc_test.mocks.dart';

// @GenerateMocks([GetBalance])
// void main() {
//   late MockGetBalance mockGetBalance;
//   late BalanceBloc balanceBloc;

//   setUp(() {
//     mockGetBalance = MockGetBalance();
//     balanceBloc = BalanceBloc(mockGetBalance);
//   });

//   const tBalance = Balance(amount: 1345);
//   const tAmount = 1345;

//   test(
//     'initial state is empty',
//     () {
//       expect(balanceBloc.state, BalanceEmpty());
//     },
//   );

//   blocTest<BalanceBloc, BalanceState>(
//     'emits [loading, has data] when data is gotten successfully',
//     build: () {
//       when(mockGetBalance.get())
//           .thenAnswer((_) async => const Right(tBalance));
//       return balanceBloc;
//     },
//     act: (bloc) => bloc.add(const OnChanged(tAmount)),
//     wait: const Duration(milliseconds: 100),
//     expect: () => [
//       BalanceLoading(),
//       const BalanceHasData(tBalance),
//     ],
//     verify: (bloc) {
//       verify(mockGetBalance.get());
//     },
//   );

//   blocTest<BalanceBloc, BalanceState>(
//     'emits [loading, error] when get data is unsuccessful',
//     build: () {
//       when(mockGetBalance.get())
//           .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
//       return balanceBloc;
//     },
//     act: (bloc) => bloc.add(const OnChanged(tAmount)),
//     expect: () => [
//       BalanceLoading(),
//       const BalanceError('Server failure'),
//     ],
//     verify: (bloc) {
//       verify(mockGetBalance.get());
//     },
//   );
// }
