import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/balance_remote_data_source.dart';
import 'data/datasources/detail_remote_data_source.dart';
import 'data/datasources/savings_local_data_source.dart';
import 'data/datasources/statement_remote_data_source.dart';
import 'data/repositories/balance_repository_impl.dart';
import 'data/repositories/detail_repository_impl.dart';
import 'data/repositories/savings_repository_impl.dart';
import 'data/repositories/statement_repository_impl.dart';
import 'domain/repositories/balance_repository.dart';
import 'domain/repositories/detail_repository.dart';
import 'domain/repositories/savings_repository.dart';
import 'domain/repositories/statement_repository.dart';
import 'domain/usecases/balance/get_balance.dart';
import 'domain/usecases/balance/get_balance_impl.dart';
import 'domain/usecases/detail/get_detail.dart';
import 'domain/usecases/savings/get_savings.dart';
import 'domain/usecases/statement/get_statement.dart';
import 'presentation/bloc/app/app_bloc.dart';
import 'presentation/bloc/balance/balance_cubit.dart';
import 'presentation/bloc/balance/balance_visibility_cubit.dart';
import 'presentation/bloc/detail/detail_cubit.dart';
import 'presentation/bloc/login/login_cubit.dart';
import 'presentation/bloc/savings/savings_cubit.dart';
import 'presentation/bloc/statement/statement_cubit.dart';
import 'presentation/pages/sign_up/cubit/sign_up_cubit.dart';

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

  // locator.registerLazySingleton<GoalCubit>(
  //   () => GoalCubit(
  //     locator<GetGoal>(),
  //     locator<AddGoal>(),
  //     locator<UpdateGoal>(),
  //     locator<RemoveGoal>(),
  //   ),
  // );

  locator.registerFactory<StatementCubit>(
    () => StatementCubit(locator<GetStatement>()),
  );

  // bloc
  locator.registerLazySingleton(
    () => AppBloc(authenticationRepository: locator()),
  );

  locator.registerLazySingleton(
    () => AuthenticationRepository(),
  );

  locator.registerFactory(
    () => SignUpCubit(locator()),
  );
  locator.registerLazySingleton(
    () => LoginCubit(locator()),
  );

  // usecase
  locator.registerFactory<DetailCubit>(
    () => DetailCubit(locator<GetDetail>()),
  );

  // usecases
  locator.registerLazySingleton<GetBalance>(
    () => GetBalanceImpl(locator<BalanceRepository>()),
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

  locator.registerLazySingleton<SavingsRepository>(
    () => SavingsRepositoryImpl(locator<SavingsLocalDataSource>()),
  );

  // datasources
  locator.registerLazySingleton<BalanceRemoteDataSource>(
    () => BalanceRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<StatementRemoteDataSource>(
    () => StatementRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(locator()),
  );

  // external
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
