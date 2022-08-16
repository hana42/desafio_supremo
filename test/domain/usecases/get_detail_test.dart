import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:desafio_supremo/domain/usecases/detail/get_detail_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockDetailRepository mockDetailRepository;
  late GetDetailImpl usecase;

  setUp(() {
    mockDetailRepository = MockDetailRepository();
    usecase = GetDetailImpl(mockDetailRepository);
  });

  const tId = '49E27207-F3A7-4264-B021-0188690F7D43';

  Detail testDetail = Detail(
    amount: 1615,
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    tType: 'PIXCASHIN',
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    to: 'Karen Amidala',
    description: 'Transferência PIX recebida',
  );

  group('getBalance', () {
    test('returns a Detail when successful', () async {
      when(mockDetailRepository(tId))
          .thenAnswer((_) async => Right(testDetail));

      final result = await usecase(tId);

      expect(result.right, equals(testDetail));
    });
  });
}
