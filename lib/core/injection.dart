import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:desafio_supremo/data/datasources/balance_visibility/balance_visibility_local_data_source_impl.dart';
import 'package:desafio_supremo/data/repositories/balance_visibility_repository_impl.dart';
import 'package:desafio_supremo/domain/usecases/balance_visibility/get_balance_visibility_impl.dart';
import 'package:desafio_supremo/domain/usecases/balance_visibility/save_balance_visibility_impl.dart';

import '../data/datasources/balance/balance_remote_data_source_impl.dart';
import '../data/datasources/detail/detail_remote_data_source_impl.dart';
import '../data/datasources/savings/savings_local_data_source_impl.dart';
import '../data/datasources/statement/statement_remote_data_source_impl.dart';
import '../data/repositories/balance_repository_impl.dart';
import '../data/repositories/detail_repository_impl.dart';
import '../data/repositories/savings_repository_impl.dart';
import '../data/repositories/statement_repository_impl.dart';
import '../domain/usecases/balance/get_balance_impl.dart';
import '../domain/usecases/detail/get_detail_impl.dart';
import '../domain/usecases/savings/get_savings_impl.dart';
import '../domain/usecases/statement/get_statement_impl.dart';
import '../presentation/bloc/app/app_bloc.dart';
import '../presentation/bloc/balance/balance_cubit.dart';
import '../presentation/bloc/balance_visibility/balance_visibility_cubit.dart';
import '../presentation/bloc/detail/detail_cubit.dart';
import '../presentation/bloc/login/login_cubit.dart';
import '../presentation/bloc/savings/savings_cubit.dart';
import '../presentation/bloc/statement/statement_cubit.dart';
import '../presentation/pages/sign_up/cubit/sign_up_cubit.dart';

final locator = GetIt.instance;

void init() {
  // bloc/cubit
  locator.registerLazySingleton<BalanceCubit>(
    () => BalanceCubit(locator<GetBalanceImpl>()),
  );

  locator.registerLazySingleton<BalanceVisibilityCubit>(
    () => BalanceVisibilityCubit(
      GetBalanceVisibilityImpl(
        BalanceVisibilityRepositoryImpl(
            BalanceVisibilityLocalDataSourceImpl(locator())),
      ),
      SaveBalanceVisibilityImpl(
        (BalanceVisibilityRepositoryImpl(
          BalanceVisibilityLocalDataSourceImpl(locator()),
        )),
      ),
      BalanceVisibilityLocalDataSourceImpl(locator()),
    ),
  );

  locator.registerFactory<DetailCubit>(
    () => DetailCubit(locator<GetDetailImpl>()),
  );

  locator.registerLazySingleton<SavingsCubit>(
    () => SavingsCubit(locator<GetSavingsImpl>()),
  );

  locator.registerFactory<StatementCubit>(
    () => StatementCubit(locator<GetStatementImpl>()),
  );

  locator.registerFactory<AppBloc>(
    () =>
        AppBloc(authenticationRepository: locator<AuthenticationRepository>()),
  );

  locator.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepository(),
  );

  locator.registerFactory<SignUpCubit>(
    () => SignUpCubit(locator<AuthenticationRepository>()),
  );

  locator.registerLazySingleton<LoginCubit>(
    () => LoginCubit(locator<AuthenticationRepository>()),
  );

  // usecases
  locator.registerLazySingleton<GetBalanceImpl>(
    () => GetBalanceImpl(locator<BalanceRepositoryImpl>()),
  );

  locator.registerLazySingleton<GetStatementImpl>(
    () => GetStatementImpl(locator<StatementRepositoryImpl>()),
  );

  locator.registerLazySingleton<GetDetailImpl>(
    () => GetDetailImpl(locator<DetailRepositoryImpl>()),
  );

  locator.registerLazySingleton<GetSavingsImpl>(
    () => GetSavingsImpl(locator<SavingsRepositoryImpl>()),
  );

  // repositories impl
  locator.registerLazySingleton<BalanceRepositoryImpl>(
    () => BalanceRepositoryImpl(locator<BalanceRemoteDataSourceImpl>()),
  );

  locator.registerLazySingleton<StatementRepositoryImpl>(
    () => StatementRepositoryImpl(locator<StatementRemoteDataSourceImpl>()),
  );

  locator.registerLazySingleton<DetailRepositoryImpl>(
    () => DetailRepositoryImpl(locator<DetailRemoteDataSourceImpl>()),
  );

  locator.registerLazySingleton<SavingsRepositoryImpl>(
    () => SavingsRepositoryImpl(locator<SavingsLocalDataSourceImpl>()),
  );

  // datasources impl
  locator.registerLazySingleton<BalanceRemoteDataSourceImpl>(
    () => BalanceRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<StatementRemoteDataSourceImpl>(
    () => StatementRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<DetailRemoteDataSourceImpl>(
    () => DetailRemoteDataSourceImpl(locator()),
  );

  // external
  locator.registerLazySingleton(
    () => http.Client(),
  );

  locator.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}
