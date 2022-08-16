import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_supremo/data/datasources/savings/savings_local_data_source_impl.dart';
import 'package:desafio_supremo/data/models/savings/savings_model.dart';

import '../../../helpers/json_reader.dart';

void main() {
  late SavingsLocalDataSourceImpl dataSource;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    dataSource = SavingsLocalDataSourceImpl();
  });

  group('get savings', () {
    final tSavingsModel = SavingsModel.fromJson(
      json.decode(readJson('helpers/dummy_data/dummy_savings_response.json')),
    );

    test('returns a savings model when successful', () async {
      final call = await dataSource.getSavings();

      expect(call, equals(tSavingsModel));
    });
  });
}
