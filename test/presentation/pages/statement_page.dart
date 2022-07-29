// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:desafio_supremo/domain/entities/balance.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_bloc.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';
// import 'package:desafio_supremo/presentation/bloc/balance/balance_state.dart';
// import 'package:desafio_supremo/presentation/pages/statement_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mocktail/mocktail.dart';

// class MockBalanceBloc extends MockBloc<BalanceEvent, BalanceState>
//     implements BalanceBloc {}

// class FakeBalanceState extends Fake implements BalanceState {}

// class FakeBalanceEvent extends Fake implements BalanceEvent {}

// void main() {
//   late MockBalanceBloc mockBalanceBloc;

//   setUpAll(() async {
//     HttpOverrides.global = null;
//     registerFallbackValue(FakeBalanceState());
//     registerFallbackValue(FakeBalanceEvent());

//     final di = GetIt.instance;
//     di.registerFactory(() => mockBalanceBloc);
//   });

//   setUp(() {
//     mockBalanceBloc = MockBalanceBloc();
//   });

//   // const tBalance = Balance(amount: 1345);

//   Widget _makeTestableWidget(Widget body) {
//     return BlocProvider<BalanceBloc>.value(
//       value: mockBalanceBloc,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }

//   // testWidgets(
//   //   'text field should trigger state to change from empty to loading',
//   //   (WidgetTester tester) async {
//   //     // arrange
//   //     when(() => mockBalanceBloc.state).thenReturn(BalanceEmpty());

//   //     // act
//   //     await tester.pumpWidget(_makeTestableWidget(BalancePage()));
//   //     await tester.enterText(find.byType(TextField), 'Jakarta');
//   //     await tester.testTextInput.receiveAction(TextInputAction.done);
//   //     await tester.pumpAndSettle();

//   //     // assert
//   //     verify(() => mockBalanceBloc.add(OnCityChanged('Jakarta'))).called(1);
//   //     expect(find.byType(TextField), equals(findsOneWidget));
//   //   },
//   // );

//   testWidgets(
//     'should show progress indicator when state is loading',
//     (WidgetTester tester) async {
//       // arrange
//       when(() => mockBalanceBloc.state).thenReturn(BalanceLoading());

//       // act
//       await tester.pumpWidget(_makeTestableWidget(const BalancePage()));

//       // assert
//       expect(find.byType(CircularProgressIndicator), equals(findsOneWidget));
//     },
//   );

//   // testWidgets(
//   //   'should show widget contain balance data when state is has data',
//   //   (WidgetTester tester) async {
//   //     // arrange
//   //     when(() => mockBalanceBloc.state).thenReturn(const BalanceHasData(tBalance));

//   //     // act
//   //     await tester.pumpWidget(_makeTestableWidget(const BalancePage()));
//   //     await tester.runAsync(() async {
//   //       final HttpClient client = HttpClient();
//   //       await client.getUrl(Uri.parse(Urls.balanceIcon('02d')));
//   //     });
//   //     await tester.pumpAndSettle();

//   //     // assert
//   //     expect(find.byKey(const Key('balance_data')), equals(findsOneWidget));
//   //   },
//   // );
// }