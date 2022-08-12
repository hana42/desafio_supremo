import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:desafio_supremo/data/datasources/goal_local_data_source.dart';
import 'package:desafio_supremo/data/datasources/savings_local_data_source.dart';
import 'package:desafio_supremo/data/repositories/goal_repository_impl.dart';
import 'package:desafio_supremo/data/repositories/savings_repository_impl.dart';
import 'package:desafio_supremo/domain/repositories/goal_repository.dart';
import 'package:desafio_supremo/domain/repositories/savings_repository.dart';
import 'package:desafio_supremo/domain/usecases/add_goal.dart';
import 'package:desafio_supremo/domain/usecases/get_detail.dart';
import 'package:desafio_supremo/domain/usecases/get_goal.dart';
import 'package:desafio_supremo/domain/usecases/get_savings.dart';
import 'package:desafio_supremo/domain/usecases/get_statement.dart';
import 'package:desafio_supremo/domain/usecases/remove_goal.dart';
import 'package:desafio_supremo/domain/usecases/update_goal.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_visibility_cubit.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_cubit.dart';
import 'package:desafio_supremo/presentation/bloc/savings/savings_cubit.dart';

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
import 'presentation/bloc/balance/balance_cubit.dart';
import 'presentation/bloc/detail/detail_cubit.dart';
import 'presentation/bloc/statement/statement_cubit.dart';

final locator = GetIt.instance;

void init() {
  // bloc/cubit
  locator.registerLazySingleton<BalanceCubit>(
    () => BalanceCubit(locator<GetBalance>()),
  );

  locator.registerLazySingleton<BalanceVisibilityCubit>(
    () => BalanceVisibilityCubit(),
  );

  locator.registerLazySingleton<SavingsCubit>(
    () => SavingsCubit(locator<GetSavings>()),
  );

  locator.registerLazySingleton<GoalCubit>(
    () => GoalCubit(
      locator<GetGoal>(),
      locator<AddGoal>(),
      locator<UpdateGoal>(),
      locator<RemoveGoal>(),
    ),
  );

  locator.registerFactory<StatementCubit>(
    () => StatementCubit(locator<GetStatement>()),
  );

  // usecase
  locator.registerLazySingleton(
    () => GetBalance(locator()),
  );
  locator.registerLazySingleton(
    () => GetStatement(locator()),
  );
  locator.registerLazySingleton(
    () => GetDetail(locator()),);

  locator.registerFactory<DetailCubit>(
    () => DetailCubit(locator<GetDetail>()),
  );

  // usecases
  locator.registerLazySingleton<GetBalance>(
    () => GetBalance(locator<BalanceRepository>()),
  );

  locator.registerLazySingleton<GetStatement>(
    () => GetStatement(locator<StatementRepository>()),
  );

  locator.registerLazySingleton<GetDetail>(
    () => GetDetail(locator<DetailRepository>()),
  );

  locator.registerLazySingleton<GetSavings>(
    () => GetSavings(locator<SavingsRepository>()),
  );

  locator.registerLazySingleton<GetGoal>(
    () => GetGoal(locator<GoalRepository>()),
  );

  locator.registerLazySingleton<AddGoal>(
    () => AddGoal(locator<GoalRepository>()),
  );

  locator.registerLazySingleton<RemoveGoal>(
    () => RemoveGoal(locator<GoalRepository>()),
  );

  locator.registerLazySingleton<UpdateGoal>(
    () => UpdateGoal(locator<GoalRepository>()),
  );

  // repositories
  locator.registerLazySingleton<BalanceRepository>(
    () => BalanceRepositoryImpl(locator<BalanceRemoteDataSource>()),
  );

  locator.registerLazySingleton<StatementRepository>(
    () => StatementRepositoryImpl(locator<StatementRemoteDataSource>()),
  );

  locator.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(locator<DetailRemoteDataSource>()),
  );

  locator.registerLazySingleton<GoalRepository>(
    () => GoalRepositoryImpl(locator<GoalLocalDataSource>()),
  );

  locator.registerLazySingleton<SavingsRepository>(
    () => SavingsRepositoryImpl(locator<SavingsLocalDataSource>()),
  );

  // datasources
  locator.registerLazySingleton<BalanceRemoteDataSource>(
    () => BalanceRemoteDataSourceImpl(client: locator()),
  );

  locator.registerLazySingleton<StatementRemoteDataSource>(
    () => StatementRemoteDataSourceImpl(client: locator()),
  );

  locator.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(client: locator()),
    () => BalanceRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<StatementRemoteDataSource>(
    () => StatementRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<GoalLocalDataSource>(
    () => GoalLocalDataSourceImpl(),
  );

  // external
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
