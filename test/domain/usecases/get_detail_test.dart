import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/domain/usecases/get_detail.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockDetailRepository mockDetailRepository;
  late GetDetail usecase;

  setUp(() {
    mockDetailRepository = MockDetailRepository();
    usecase = GetDetail(mockDetailRepository);
  });

  Detail testDetail = Detail(
    amount: 1615,
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    tType: 'PIXCASHIN',
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    to: 'Karen Amidala',
    description: 'Transferência PIX recebida',
  );

  const tId = '49E27207-F3A7-4264-B021-0188690F7D43';

  group('getBalance', () {
    test(
      'returns a Detail when successful',
      () async {
        when(mockDetailRepository.getDetail(tId))
            .thenAnswer((_) async => Right(testDetail));

        final result = await usecase.get(tId);

        expect(result.isRight, true);
        expect(result.right, isA<Detail>());
      },
    );

    test(
      'throws an exception when server fails',
      () async {
        when(mockDetailRepository.getDetail(tId))
            .thenAnswer((_) async => const Left(ServerFailure('Not Found')));

        final result = await usecase.get(tId);

        expect(result.isLeft, true);
        expect(result.left, isA<Failure>());
      },
    );

    test(
      'throws an exception when connection fails',
      () async {
        when(mockDetailRepository.getDetail(tId)).thenAnswer(
            (_) async => const Left(ConnectionFailure('No connection')));

        final result = await usecase.get(tId);

        expect(result.isLeft, true);
        expect(result.left, isA<Failure>());
      },
    );
  });
}
