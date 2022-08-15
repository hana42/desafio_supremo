import '/data/models/statement_model.dart';

abstract class StatementRemoteDataSource {
  Future<List<StatementModel>> getStatement(int limit, int offset);
}
