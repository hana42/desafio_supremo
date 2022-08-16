import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_supremo/data/models/detail/detail_model.dart';
import 'package:desafio_supremo/domain/entities/detail.dart';

import '../../helpers/json_reader.dart';

void main() {
  var tDetailModel = DetailModel(
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    amount: 1615,
    to: 'Karen Amidala',
    from: null,
    description: 'Transferência PIX recebida',
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    tType: 'PIXCASHIN',
  );

  var tDetail = Detail(
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    amount: 1615,
    to: 'Karen Amidala',
    from: null,
    description: 'Transferência PIX recebida',
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    tType: 'PIXCASHIN',
  );

  group('to entity', () {
    test('returns a subclass of detail entity', () async {
      final result = tDetailModel.toEntity();

      expect(result, equals(tDetail));
    });
  });

  group('from json', () {
    test('returns a valid model from json', () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_detail_response.json'),
      );
      final result = DetailModel.fromJson(jsonMap);

      expect(result, equals(tDetailModel));
    });
  });

  group('to json', () {
    test('returns a json map containing proper data', () async {
      final result = tDetailModel.toJson();
      final expectedJson = {
        'createdAt': '2020-11-19T03:00:00Z',
        'authentication': '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
        'amount': 1615,
        'to': 'Karen Amidala',
        'from': null,
        'bankName': null,
        'description': 'Transferência PIX recebida',
        'id': '49E27207-F3A7-4264-B021-0188690F7D43',
        'tType': 'PIXCASHIN'
      };

      expect(result, equals(expectedJson));
    });
  });
}
