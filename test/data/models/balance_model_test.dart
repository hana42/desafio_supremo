import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_supremo/data/models/balance_model.dart';
import 'package:desafio_supremo/domain/entities/balance.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tBalanceModel = BalanceModel(amount: 1345);
  const tBalance = Balance(amount: 1345);

  group('to entity', () {
    test('returns a subclass of balance entity', () async {
      final result = tBalanceModel.toEntity();

      expect(result, equals(tBalance));
    });
  });

  group('from json', () {
    test('returns a valid model from json', () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_balance_response.json'),
      );
      final result = BalanceModel.fromJson(jsonMap);

      expect(result, equals(tBalanceModel));
    });
  });

  group('to json', () {
    test('returns a json map containing proper data', () async {
      final result = tBalanceModel.toJson();
      final expectedJson = {'amount': 1345};

      expect(result, equals(expectedJson));
    });
  });
}
