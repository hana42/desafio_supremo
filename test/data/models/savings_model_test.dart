import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_supremo/data/models/savings_model.dart';
import 'package:desafio_supremo/domain/entities/savings.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tSavingsModel = SavingsModel(amount: 650);
  const tSavings = Savings(amount: 650);

  group('to entity', () {
    test('returns a subclass of savings entity', () async {
      final result = tSavingsModel.toEntity();

      expect(result, equals(tSavings));
    });
  });

  group('from json', () {
    test('returns a valid model from json', () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_savings_response.json'),
      );
      final result = SavingsModel.fromJson(jsonMap);

      expect(result, equals(tSavingsModel));
    });
  });

  group('to json', () {
    test('returns a json map containing proper data', () async {
      final result = tSavingsModel.toJson();
      final expectedJson = {'amount': 650};

      expect(result, equals(expectedJson));
    });
  });
}
