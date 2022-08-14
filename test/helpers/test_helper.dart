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
import 'package:desafio_supremo/domain/repositories/savings_repository.dart';
import 'package:desafio_supremo/domain/repositories/statement_repository.dart';
import 'package:desafio_supremo/domain/usecases/balance/get_balance.dart';
import 'package:desafio_supremo/domain/usecases/balance/get_balance_impl.dart';
import 'package:desafio_supremo/domain/usecases/detail/get_detail.dart';
import 'package:desafio_supremo/domain/usecases/savings/get_savings.dart';
import 'package:desafio_supremo/domain/usecases/statement/get_statement.dart';

@GenerateMocks([
  /* domain */
  GetBalance,
  GetStatement,
  GetDetail,
  GetSavings,
  BalanceRepository,
  StatementRepository,
  DetailRepository,
  SavingsRepository,

  /* data */
  BalanceRemoteDataSourceImpl,
  StatementRemoteDataSourceImpl,
  DetailRemoteDataSourceImpl,
  BalanceRepositoryImpl,
  StatementRepositoryImpl,
  DetailRepositoryImpl,
  BalanceRemoteDataSourceImpl,
  StatementRemoteDataSourceImpl,
  DetailRemoteDataSourceImpl,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
