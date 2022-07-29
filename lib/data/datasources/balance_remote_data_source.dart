import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/error/exception.dart';
import '../../core/utils/api.utils.dart';

import '../models/balance_model.dart';

abstract class BalanceRemoteDataSource {
  Future<BalanceModel> getBalance();
}

class BalanceRemoteDataSourceImpl implements BalanceRemoteDataSource {
  final http.Client client;
  BalanceRemoteDataSourceImpl({required this.client});

  @override
  Future<BalanceModel> getBalance() async {
    final response = await client.get(
      Uri.parse(API.balance),
      headers: API.defaultHeaders,
    );

    if (response.statusCode == 200) {
      return BalanceModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
