import 'package:desafio_supremo/presentation/bloc/detail/detail_event.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_event.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:desafio_supremo/domain/usecases/get_detail.dart';
import 'package:desafio_supremo/domain/usecases/get_statement.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';

import 'data/datasources/balance_remote_data_source.dart';
import 'data/datasources/detail_remote_data_source.dart';
import 'data/datasources/statement_remote_data_source.dart';
import 'data/repositories/balance_repository_impl.dart';
import 'data/repositories/detail_repository_impl.dart';
import 'data/repositories/statement_repository_impl.dart';
import 'domain/repositories/balance_repository.dart';
import 'domain/repositories/detail_repository.dart';
import 'domain/repositories/statement_repository.dart';
import 'domain/usecases/get_balance.dart';
import 'presentation/bloc/balance/balance_bloc.dart';
import 'presentation/bloc/detail/detail_bloc.dart';
import 'presentation/bloc/statement/statement_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => BalanceBloc(locator())..add(const FetchBalance()));
  locator.registerFactory(
      () => StatementBloc(locator())..add(const FetchStatement()));
  // locator.registerFactory(() => DetailBloc(locator())..add(const FetchDetail(locator())));

  // usecase
  locator.registerLazySingleton(() => GetBalance(locator()));
  locator.registerLazySingleton(() => GetStatement(locator()));
  locator.registerLazySingleton(() => GetDetail(locator()));

  // repository
  locator.registerLazySingleton<BalanceRepository>(
    () => BalanceRepositoryImpl(
      balanceRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<StatementRepository>(
    () => StatementRepositoryImpl(
      statementRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(
      detailRemoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<BalanceRemoteDataSource>(
    () => BalanceRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<StatementRemoteDataSource>(
    () => StatementRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
