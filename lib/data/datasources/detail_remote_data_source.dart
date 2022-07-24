import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/error/exception.dart';
import '../../core/utils/urls.dart';
import '../models/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<DetailModel> getDetail(String id);
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;
  DetailRemoteDataSourceImpl({required this.client});

  @override
  Future<DetailModel> getDetail(String id) async {
    final response = await client.get(
      Uri.parse(Urls.detail(id)),
      headers: Urls.defaultHeaders,
    );

    if (response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
