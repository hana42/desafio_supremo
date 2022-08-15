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
    try {
      final response = await client.get(
        Uri.parse(API.detail(id)),
        headers: API.defaultHeaders,
      );

      if (response.statusCode == 200) {
        try {
          return DetailModel.fromJson(json.decode(response.body));
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
