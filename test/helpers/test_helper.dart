import 'package:desafio_supremo/data/repositories/detail_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:desafio_supremo/data/datasources/balance_remote_data_source.dart';
import 'package:desafio_supremo/data/datasources/detail_remote_data_source.dart';
import 'package:desafio_supremo/data/datasources/statement_remote_data_source.dart';
import 'package:desafio_supremo/domain/repositories/balance_repository.dart';
import 'package:desafio_supremo/domain/repositories/detail_repository.dart';
import 'package:desafio_supremo/domain/repositories/statement_repository.dart';

@GenerateMocks([
  BalanceRepository,
  StatementRepository,
  DetailRepository,
  BalanceRemoteDataSource,
  DetailRemoteDataSource,
  StatementRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
