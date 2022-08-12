import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_supremo/data/models/statement_model.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';

import '../../helpers/json_reader.dart';

void main() {
  StatementModel tStatementModel = StatementModel(
    createdAt: DateTime.parse('2020-11-26T03:00:00Z'),
    bankName: 'Bank XPTO',
    id: 'BAF91302-3E25-4E5E-89A6-0F6CD4BEC5B6',
    description: 'Transferência PIX recebida',
    amount: 1674,
    from: 'Tiago Windu',
    tType: 'PIXCASHIN',
  );

  Statement tStatement = Statement(
    createdAt: DateTime.parse('2020-11-26T03:00:00Z'),
    bankName: 'Bank XPTO',
    id: 'BAF91302-3E25-4E5E-89A6-0F6CD4BEC5B6',
    description: 'Transferência PIX recebida',
    amount: 1674,
    from: 'Tiago Windu',
    tType: 'PIXCASHIN',
  );

  group('to entity', () {
    test('returns a subclass of statement entity', () async {
      final result = tStatementModel.toEntity();

      expect(result, equals(tStatement));
    });
  });

  group('from json', () {
    test('returns a valid model from json', () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_statement_response.json'),
      );
      List items = jsonMap['items'] as List;
      final result = [for (final item in items) StatementModel.fromJson(item)];

      expect(result, equals([tStatementModel]));
    });
  });

  group('to json', () {
    test('returns a json map containing proper data', () async {
      final result = tStatementModel.toJson();
      final expectedJson = {
        'createdAt': '2020-11-26T03:00:00Z',
        'bankName': 'Bank XPTO',
        'id': 'BAF91302-3E25-4E5E-89A6-0F6CD4BEC5B6',
        'description': 'Transferência PIX recebida',
        'amount': 1674,
        'from': 'Tiago Windu',
        'to': null,
        'tType': 'PIXCASHIN'
      };

      expect(result, equals(expectedJson));
    });
  });
}
