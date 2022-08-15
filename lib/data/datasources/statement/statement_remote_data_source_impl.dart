import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '/core/error/exception.dart';
import '/core/utils/api.utils.dart';
import '/data/models/statement_model.dart';
import 'statement_remote_data_source.dart';

class StatementRemoteDataSourceImpl implements StatementRemoteDataSource {
  StatementRemoteDataSourceImpl(this.client);
  final http.Client client;

  final String limit = '10';

  @override
  Future<List<StatementModel>> getStatement(int limit, int offset) async {
    try {
      final response = await client.get(
        Uri.parse(API.statement(limit, offset)),
        headers: API.defaultHeaders,
      );

      if (response.statusCode == 200) {
        var decodedResponse = await json.decode(response.body);
        var items = decodedResponse['items'] as List;
        List<StatementModel> statements = [
          for (var item in items) StatementModel.fromJson(item)
        ];
        return statements;
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw ServerException();
    } on FormatException {
      throw DataParsingException();
    } on SocketException {
      throw ConnectionException();
    } catch (error) {
      throw UnkownException();
    }
  }
}
