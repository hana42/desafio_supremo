import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:desafio_supremo/data/datasources/balance_visibility/balance_visibility_local_data_source_impl.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late BalanceVisibilityLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = BalanceVisibilityLocalDataSourceImpl(mockSharedPreferences);
  });

  group('getBalanceVisibility', () {
    test(
      'should return a bool from SharedPreferences when theres one in cache',
      () async {
        when(mockSharedPreferences.getBool('isVisible')).thenReturn(false);

        final result = dataSource.get();

        verify(mockSharedPreferences.getBool('isVisible'));

        expect(result, isFalse);
      },
    );

    //   test(
    //     'should save and return a bool from SharedPreferences',
    //     () async {
    //       when(mockSharedPreferences.setBool('isVisible', true))
    //           .thenAnswer((_) => Future.value(true));

    //       final result = await dataSource.post(true);

    //       verify(await mockSharedPreferences.setBool('isVisible', true));

    //       expect(result, isTrue);
    //     },
    //   );
  });
}
