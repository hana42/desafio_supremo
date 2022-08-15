import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/domain/entities/balance.dart';
import 'package:desafio_supremo/domain/usecases/balance/get_balance.dart';
import 'package:desafio_supremo/domain/usecases/balance/get_balance_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBalanceRepository mockBalanceRepository;
  late GetBalance usecase;

  setUp(() {
    mockBalanceRepository = MockBalanceRepository();
    usecase = GetBalanceImpl(mockBalanceRepository);
  });

  const testBalance = Balance(amount: 1345);

  group('getBalance', () {
    test('returns a Balance when successful', () async {
      when(mockBalanceRepository())
          .thenAnswer((_) async => const Right(testBalance));

      final result = await usecase();

      expect(result.right, equals(testBalance));
    });
  });
}
