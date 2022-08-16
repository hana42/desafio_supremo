import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/error/exception.dart';
import '../../models/savings_model.dart';

import 'savings_local_data_source.dart';

class SavingsLocalDataSourceImpl implements SavingsLocalDataSource {
  SavingsLocalDataSourceImpl();

  @override
  Future<SavingsModel> getSavings() async {
    final SavingsModel response = SavingsModel.fromJson(
      json.decode('assets/data/savings.json'),
    );

    try {
      return response;
    } on FormatException {
      throw DataParsingException();
    } catch (error) {
      throw UnkownException();
    }
  }
}
