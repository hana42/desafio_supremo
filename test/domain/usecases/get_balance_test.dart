import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/domain/entities/balance.dart';
import 'package:desafio_supremo/domain/usecases/get_balance.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBalanceRepository mockBalanceRepository;
  late GetBalance usecase;

  setUp(() {
    mockBalanceRepository = MockBalanceRepository();
    usecase = GetBalance(mockBalanceRepository);
  });

  const testBalance = Balance(amount: 1245);

  const tAmount = 1245;

  test(
    'should get current balance from the repository',
    () async {
      when(mockBalanceRepository.getBalance(tAmount))
          .thenAnswer((_) async => const Right(testBalance));

      final result = await usecase.execute(tAmount);

      expect(result, equals(const Right(testBalance)));
    },
  );
}
