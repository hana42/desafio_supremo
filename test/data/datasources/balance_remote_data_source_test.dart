import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/utils/urls.dart';
import 'package:desafio_supremo/data/datasources/balance_remote_data_source.dart';
import 'package:desafio_supremo/data/models/balance_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late BalanceRemoteDataSource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = BalanceRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get current balance', () {
    final tBalanceModel = BalanceModel.fromJson(
      json.decode(readJson('helpers/dummy_data/dummy_balance_response.json')),
    );

    test('returns a balance model when the response code is 200', () async {
      when(mockHttpClient.get(
        Uri.parse(Urls.balance),
        headers: Urls.defaultHeaders,
      )).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_balance_response.json'), 200));

      final result = await dataSource.getBalance();

      expect(result, equals(tBalanceModel));
    });

    test('returns a server exception when the response code is 404 or other',
        () async {
      when(
        mockHttpClient.get(
          Uri.parse(Urls.balance),
          headers: Urls.defaultHeaders,
        ),
      ).thenAnswer((_) async => http.Response('Not found', 404));

      final call = dataSource.getBalance();

      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
