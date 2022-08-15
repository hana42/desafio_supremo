import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:desafio_supremo/data/datasources/balance/balance_remote_data_source_impl.dart';
import 'package:desafio_supremo/data/datasources/detail/detail_remote_data_source_impl.dart';
import 'package:desafio_supremo/data/datasources/savings/savings_local_data_source_impl.dart';
import 'package:desafio_supremo/data/datasources/statement/statement_remote_data_source_impl.dart';
import 'package:desafio_supremo/data/repositories/balance_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/detail_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/savings_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/statement_repository_impl.dart';
import 'package:desafio_supremo/domain/repositories/balance_repository.dart';
import 'package:desafio_supremo/domain/repositories/detail_repository.dart';
import 'package:desafio_supremo/domain/repositories/savings_repository.dart';
import 'package:desafio_supremo/domain/repositories/statement_repository.dart';
import 'package:desafio_supremo/domain/usecases/balance/get_balance_impl.dart';
import 'package:desafio_supremo/domain/usecases/detail/get_detail_impl.dart';
import 'package:desafio_supremo/domain/usecases/savings/get_savings_impl.dart';
import 'package:desafio_supremo/domain/usecases/statement/get_statement_impl.dart';

@GenerateMocks([
  /* domain */
  GetBalanceImpl,
  GetStatementImpl,
  GetDetailImpl,
  GetSavingsImpl,
  BalanceRepository,
  StatementRepository,
  DetailRepository,
  SavingsRepository,

  /* data */
  BalanceRemoteDataSourceImpl,
  StatementRemoteDataSourceImpl,
  DetailRemoteDataSourceImpl,
  SavingsLocalDataSourceImpl,
  BalanceRepositoryImpl,
  StatementRepositoryImpl,
  DetailRepositoryImpl,
  SavingsRepositoryImpl,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
