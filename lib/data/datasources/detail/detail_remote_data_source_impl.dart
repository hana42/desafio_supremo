import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/error/exception.dart';
import '../../../core/utils/api.utils.dart';
import '../../models/detail_model.dart';

import 'detail_remote_data_source.dart';

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  DetailRemoteDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<DetailModel> getDetail(String id) async {
    final response = await client.get(
      Uri.parse(API.detail(id)),
      headers: API.defaultHeaders,
    );

    if (response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
