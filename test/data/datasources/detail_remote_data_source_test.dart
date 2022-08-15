import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/utils/api.utils.dart';
import 'package:desafio_supremo/data/datasources/detail/detail_remote_data_source.dart';
import 'package:desafio_supremo/data/datasources/detail/detail_remote_data_source_impl.dart';
import 'package:desafio_supremo/data/models/detail_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late DetailRemoteDataSource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = DetailRemoteDataSourceImpl(mockHttpClient);
  });

  const String id = '49E27207-F3A7-4264-B021-0188690F7D43';

  group('get detail', () {
    final tDetailModel = DetailModel.fromJson(
      json.decode(readJson('helpers/dummy_data/dummy_detail_response.json')),
    );

    test('returns a detail model when the response code is 200', () async {
      when(mockHttpClient.get(
        Uri.parse(API.detail(id)),
        headers: API.defaultHeaders,
      )).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_detail_response.json'), 200));

      final result = await dataSource.getDetail(id);

      expect(result, equals(tDetailModel));
    });

    test('returns a server exception when the response code is 404 or other',
        () async {
      when(
        mockHttpClient.get(
          Uri.parse(API.detail(id)),
          headers: API.defaultHeaders,
        ),
      ).thenAnswer((_) async => http.Response('Not found', 404));

      final call = dataSource.getDetail(id);

      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
