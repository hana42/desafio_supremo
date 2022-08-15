import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:desafio_supremo/core/error/exception.dart';
import 'package:desafio_supremo/core/error/failure.dart';
import 'package:desafio_supremo/data/models/detail_model.dart';
import 'package:desafio_supremo/data/repositories/detail_repository_impl.dart';
import 'package:desafio_supremo/domain/entities/detail.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockDetailRemoteDataSourceImpl mockDetailRemoteDataSource;
  late DetailRepositoryImpl repository;

  var tDetailModel = DetailModel(
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    amount: 1615,
    to: 'Karen Amidala',
    description: 'Transferência PIX recebida',
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    tType: 'PIXCASHIN',
  );

  var tDetail = Detail(
    createdAt: DateTime.parse('2020-11-19T03:00:00Z'),
    authentication: '15BA0BB3-EFDB-44E9-99BA-3D0F8725C0E3',
    amount: 1615,
    to: 'Karen Amidala',
    description: 'Transferência PIX recebida',
    id: '49E27207-F3A7-4264-B021-0188690F7D43',
    tType: 'PIXCASHIN',
  );

  const String id = '49E27207-F3A7-4264-B021-0188690F7D43';

  setUp(() {
    mockDetailRemoteDataSource = MockDetailRemoteDataSourceImpl();
    repository = DetailRepositoryImpl(mockDetailRemoteDataSource);
  });

  group('get detail', () {
    test('returns a detail when a call to datasource is successful', () async {
      when(mockDetailRemoteDataSource.getDetail(id))
          .thenAnswer((_) async => tDetailModel);

      final result = await repository(id);

      verify(mockDetailRemoteDataSource.getDetail(id));

      expect(result.isRight, true);
      expect(result.right, equals(tDetail));
    });

    test('returns a server failure when a call to datasource is unsuccessful',
        () async {
      when(mockDetailRemoteDataSource.getDetail(id))
          .thenThrow(ServerException());

      final result = await repository(id);

      verify(mockDetailRemoteDataSource.getDetail(id));

      expect(result.left, equals(const ServerFailure()));
    });

    test('returns data parsing failure when fails to decode json', () async {
      when(mockDetailRemoteDataSource.getDetail(id))
          .thenThrow(FormatException(''));

      final result = await repository(id);

      verify(mockDetailRemoteDataSource.getDetail(id));

      expect(result.left, equals(const DataParsingFailure()));
    });

    test('returns connection failure when the device has no internet',
        () async {
      when(mockDetailRemoteDataSource.getDetail(id))
          .thenThrow(const SocketException(''));

      final result = await repository(id);

      verify(mockDetailRemoteDataSource.getDetail(id));

      expect(result.left, equals(const ConnectionFailure()));
    });

    test('returns a unkown failure when another type of Exception is thrown',
        () async {
      when(mockDetailRemoteDataSource.getDetail(id)).thenThrow(Exception(''));

      final result = await repository(id);

      verify(mockDetailRemoteDataSource.getDetail(id));

      expect(result.left, equals(const UnkownFailure()));
    });
  });
}
