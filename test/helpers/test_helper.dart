import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:desafio_supremo/data/datasources/balance_remote_data_source.dart';
import 'package:desafio_supremo/data/datasources/detail_remote_data_source.dart';
import 'package:desafio_supremo/data/datasources/statement_remote_data_source.dart';
import 'package:desafio_supremo/data/repositories/balance_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/detail_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/statement_repository_impl.dart';
import 'package:desafio_supremo/domain/repositories/balance_repository.dart';
import 'package:desafio_supremo/domain/repositories/detail_repository.dart';
import 'package:desafio_supremo/domain/repositories/statement_repository.dart';

@GenerateMocks([
  /* domain */

  // usecases
  BalanceRepository,
  StatementRepository,
  DetailRepository,

  /* data */

  // datasources
  BalanceRemoteDataSource,
  DetailRemoteDataSource,
  StatementRemoteDataSource,

  // repositories
  BalanceRepositoryImpl,
  StatementRepositoryImpl,
  DetailRepositoryImpl,

  BalanceRemoteDataSourceImpl,
  DetailRemoteDataSourceImpl,
  StatementRemoteDataSourceImpl,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
