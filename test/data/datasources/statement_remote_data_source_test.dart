import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/utils/api.utils.dart';
import 'package:desafio_supremo/data/datasources/statement_remote_data_source.dart';
import 'package:desafio_supremo/data/models/statement_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late StatementRemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = StatementRemoteDataSourceImpl(client: mockHttpClient);
  });

  const int limit = 10;
  const int offset = 1;

  group('get statement', () {
    final decodedJson = json.decode(
      readJson('helpers/dummy_data/dummy_statement_response.json'),
    );
    final items = decodedJson['items'] as List;
    final tStatementModel = [
      for (final item in items) StatementModel.fromJson(item)
    ];

    test('returns a statement model when the response code is 200', () async {
      when(mockHttpClient.get(
        Uri.parse(API.statement(limit, offset)),
        headers: API.defaultHeaders,
      )).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_statement_response.json'), 200));

      final result = await dataSource.getStatement(offset);

      expect(result, equals(tStatementModel));
    });

    test('returns a server exception when the response code is 404 or other',
        () async {
      when(
        mockHttpClient.get(
          Uri.parse(API.statement(limit, offset)),
          headers: API.defaultHeaders,
        ),
      ).thenAnswer((_) async => http.Response('Not found', 404));

      final call = dataSource.getStatement(offset);

      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
