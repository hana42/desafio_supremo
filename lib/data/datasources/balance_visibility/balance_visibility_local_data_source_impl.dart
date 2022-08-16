import 'package:shared_preferences/shared_preferences.dart';

import 'package:desafio_supremo/core/error/exception.dart';

abstract class BalanceVisibilityLocalDataSource {
  Future<bool> get();
  Future<bool> post(bool isVisible);
}

class BalanceVisibilityLocalDataSourceImpl
    implements BalanceVisibilityLocalDataSource {
  BalanceVisibilityLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> get() {
    final bool? json = sharedPreferences.getBool('isVisible');
    if (json != null) {
      return Future.value(json);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> post(bool isVisible) {
    return sharedPreferences.setBool('isVisible', isVisible);
  }
}
