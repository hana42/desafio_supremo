import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:desafio_supremo/data/datasources/balance_visibility/balance_visibility_local_data_source_impl.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  BalanceVisibilityLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = BalanceVisibilityLocalDataSourceImpl(mockSharedPreferences);
  });
}
