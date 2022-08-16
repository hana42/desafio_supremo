import '../../models/statement/statement_model.dart';

abstract class StatementRemoteDataSource {
  Future<List<StatementModel>> getStatement(int limit, int offset);
}
