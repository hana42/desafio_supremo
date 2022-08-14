import 'dart:convert';

import 'package:http/http.dart' as http;

import '/core/error/exception.dart';
import '/core/utils/api.utils.dart';
import '/data/models/statement_model.dart';

abstract class StatementRemoteDataSource {
  Future<List<StatementModel>> getStatement(int limit, int offset);
}

class StatementRemoteDataSourceImpl implements StatementRemoteDataSource {
  StatementRemoteDataSourceImpl(this.client);
  final http.Client client;

  final String limit = '10';

  @override
  Future<List<StatementModel>> getStatement(int limit, int offset) async {
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
  }
}
