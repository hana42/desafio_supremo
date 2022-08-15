import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

import 'package:desafio_supremo/core/utils/api.utils.dart';
import 'package:desafio_supremo/domain/entities/balance.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_cubit.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_visibility_cubit.dart';
import 'package:desafio_supremo/presentation/pages/home/home_screen.dart';
import 'package:desafio_supremo/presentation/shared/widgets/balance/balance_widget.dart';
import 'package:desafio_supremo/presentation/shared/widgets/shimmer_loading.dart';

class MockBalanceCubit extends MockCubit<BalanceState> implements BalanceCubit {
}

class FakeBalanceState extends Fake implements BalanceState {}

@GenerateMocks([BalanceCubit, BalanceVisibilityCubit])
void main() {
  late MockBalanceCubit mockBalanceCubit;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeBalanceState());

    final di = GetIt.instance;
    di.registerFactory(() => mockBalanceCubit);
  });

  setUp(() {
    mockBalanceCubit = MockBalanceCubit();
  });

  const tBalance = Balance(amount: 1345);

  Widget _makeTestableWidget(Widget body) {
    return BlocBuilder<BalanceCubit, BalanceState>(
      bloc: mockBalanceCubit,
      builder: (context, state) => MaterialApp(home: body),
    );
  }

  testWidgets(
    'should trigger state to change from initial as soon as exists',
    (WidgetTester tester) async {
      when(() => mockBalanceCubit.state).thenReturn(BalanceInitial());

      // act
      await tester.pumpWidget(_makeTestableWidget(HomeScreen()));
      await tester.pumpAndSettle();

      verify(() => mockBalanceCubit.getBalance()).called(1);
      expect(find.byType(BalanceWidget), equals(findsOneWidget));
    },
  );
}
