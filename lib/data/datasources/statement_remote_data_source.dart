import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/error/exception.dart';
import '../../core/utils/urls.dart';
import '../models/statement_model.dart';

abstract class StatementRemoteDataSource {
  Future<List<StatementModel>> getStatement(String limit, String offset);
}

class StatementRemoteDataSourceImpl implements StatementRemoteDataSource {
  final http.Client client;
  StatementRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StatementModel>> getStatement(String limit, String offset) async {
    final response = await client.get(
      Uri.parse(Urls.statement(limit, offset)),
      headers: Urls.defaultHeaders,
    );

    if (response.statusCode == 200) {
      var decodedResponse = await json.decode(response.body);
      List items = decodedResponse['items'] as List;
      List<StatementModel> statements = [
        for (final item in items) StatementModel.fromJson(item)
      ];
      return statements;
    } else {
      throw ServerException();
    }
  }
}
