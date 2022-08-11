// import 'package:ghibli/models/movie_model.dart';
// import 'package:ghibli/services/hive_service.dart';

// abstract class StatementLocalDataSource {
//   Future<void> saveCache(List<Movie> statement);
//   Future<List<Movie>?> getCache();
// }

// class StatementLocalDataSourceImpl implements StatementLocalDataSource {
//   final HiveService hiveService;
//   StatementLocalDataSourceImpl({required this.hiveService});

//   final String statementBox = 'statement';

//   @override
//   Future<List<Movie>?> getCache() async {
//     return await hiveService.getItems(statementBox);
//   }

//   @override
//   Future<void> saveCache(List<Statement> statement) async {
//     await hiveService.addItems(statementBox, statement);
//   }
// }
