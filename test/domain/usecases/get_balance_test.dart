import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/failure.dart';
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

  group('getBalance', () {
    test('returns a Balance when successful', () async {
      when(mockBalanceRepository.getBalance())
          .thenAnswer((_) async => const Right(testBalance));

      final result = await usecase.get();

      expect(result.isRight, true);
      expect(result.right, isA<Balance>());
      expect(result.right, equals(testBalance));
    });

    test('throws an exception when server fails', () async {
      when(mockBalanceRepository.getBalance())
          .thenAnswer((_) async => const Left(ServerFailure('Not Found')));

      final result = await usecase.get();

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left, isA<ServerFailure>());
    });

    test('throws an exception when connection fails', () async {
      when(mockBalanceRepository.getBalance()).thenAnswer(
          (_) async => const Left(ConnectionFailure('No connection')));

      final result = await usecase.get();

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left, isA<ConnectionFailure>());
    });
  });
}
