import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

  test(
    'should get detail from the repository',
    () async {
      when(mockDetailRepository.getDetail(tId))
          .thenAnswer((_) async => Right(testDetail));

      final result = await usecase.execute(tId);

      expect(result, equals(Right(testDetail)));
    },
  );
}
