import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:desafio_supremo/core/error/exception.dart';

import '../../models/savings_model.dart';

import 'savings_local_data_source.dart';

class SavingsLocalDataSourceImpl implements SavingsLocalDataSource {
  SavingsLocalDataSourceImpl();

  @override
  Future<SavingsModel> getSavings() async {
    final response =
        json.decode(await rootBundle.loadString('assets/data/savings.json'));

    try {
      return response;
    } catch (e) {
      throw ServerException();
    }
  }
}
