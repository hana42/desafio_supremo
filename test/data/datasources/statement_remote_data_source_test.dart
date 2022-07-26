import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/utils/urls.dart';
import 'package:desafio_supremo/data/datasources/statement_remote_data_source.dart';
import 'package:desafio_supremo/data/models/statement_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late StatementRemoteDataSource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = StatementRemoteDataSourceImpl(client: mockHttpClient);
  });

  const String limit = '10';
  const String offset = '1';

  group('get current statement', () {
    final tStatementModel = StatementModel.fromJson(
      json.decode(readJson('helpers/dummy_data/dummy_statement_response.json')),
    );

    test('returns a statement model when the response code is 200', () async {
      when(mockHttpClient.get(
        Uri.parse(Urls.statement(limit, offset)),
        headers: Urls.defaultHeaders,
      )).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_statement_response.json'), 200));

      final result = await dataSource.getStatement(limit, offset);

      expect(result, equals(tStatementModel));
    });

    test('returns a server exception when the response code is 404 or other',
        () async {
      when(
        mockHttpClient.get(
          Uri.parse(Urls.statement(limit, offset)),
          headers: Urls.defaultHeaders,
        ),
      ).thenAnswer((_) async => http.Response('Not found', 404));

      final call = dataSource.getStatement(limit, offset);

      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
