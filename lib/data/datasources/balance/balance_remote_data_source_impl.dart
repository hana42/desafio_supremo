import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/error/exception.dart';
import '../../../core/utils/api.utils.dart';
import '../../models/balance_model.dart';

import 'balance_remote_data_source.dart';

class BalanceRemoteDataSourceImpl implements BalanceRemoteDataSource {
  BalanceRemoteDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<BalanceModel> getBalance() async {
    try {
      final response = await client.get(
        Uri.parse(API.balance),
        headers: API.defaultHeaders,
      );

      if (response.statusCode == 200) {
        try {
          return BalanceModel.fromJson(json.decode(response.body));
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw ServerException();
      }
    } catch (error) {
      if ((error is ServerException) || (error is DataParsingException)) {
        rethrow;
      } else {
        throw ConnectionException();
      }
    }
  }
}
