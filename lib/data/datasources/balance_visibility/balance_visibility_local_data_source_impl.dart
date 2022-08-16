import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exception.dart';

import 'balance_visibility_local_data_source.dart';

class BalanceVisibilityLocalDataSourceImpl
    implements BalanceVisibilityLocalDataSource {
  BalanceVisibilityLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  bool get() {
    final bool? result = sharedPreferences.getBool('isVisible');
    if (result != null) {
      return result;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> post(bool isVisible) async {
    final result = await sharedPreferences.setBool('isVisible', isVisible);
    return result;
  }
}
