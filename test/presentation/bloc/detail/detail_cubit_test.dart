import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/presentation/bloc/detail/detail_cubit.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetDetailImpl mockGetDetail;
  late DetailCubit balanceCubit;

  setUp(() {
    mockGetDetail = MockGetDetailImpl();
    balanceCubit = DetailCubit(mockGetDetail);
  });

  const tId = '49E27207-F3A7-4264-B021-0188690F7D43';

  var tDetail = Detail(
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    amount: 1615,
    to: 'Karen Amidala',
    from: null,
    description: 'Transferência PIX recebida',
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    tType: 'PIXCASHIN',
  );

  test(
    'initial state should be empty',
    () => expect(balanceCubit.state, DetailInitial()),
  );

  blocTest<DetailCubit, DetailState>(
    'should emit [success] when data is gotten successfully',
    build: () {
      when(mockGetDetail(tId)).thenAnswer((_) async => Right(tDetail));
      return balanceCubit;
    },
    act: (bloc) => bloc.getDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [DetailSuccess(tDetail)],
    verify: (bloc) => verify(mockGetDetail(tId)),
  );

  blocTest<DetailCubit, DetailState>(
    'should emit [error] when get data is unsuccessful',
    build: () {
      when(mockGetDetail(tId)).thenAnswer((_) async => Left(ServerFailure()));
      return balanceCubit;
    },
    act: (bloc) => bloc.getDetail(tId),
    wait: const Duration(milliseconds: 100),
    expect: () => [isA<DetailError>()],
    verify: (bloc) => verify(mockGetDetail(tId)),
  );
}
