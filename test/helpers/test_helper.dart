import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:desafio_supremo/domain/repositories/balance_repository.dart';
import 'package:desafio_supremo/domain/repositories/detail_repository.dart';
import 'package:desafio_supremo/domain/repositories/statement_repository.dart';

@GenerateMocks([
  BalanceRepository,
  StatementRepository,
  DetailRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
