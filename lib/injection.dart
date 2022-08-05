import 'package:get_it/get_it.dart';
import 'package:desafio_supremo/usecases/authentication//sign_in.dart';
import 'package:desafio_supremo/domain/services/authentication.dart';
import 'package:desafio_supremo/core/utils/firebaseAuthentication.dart';
import 'package:desafio_supremo/presentation/blocs/login/login_bloc.dart';

final sl=GetIt.instance;
void init () {
  // Blocs
  sl.registerFactory(() => LoginBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Infra services
  sl.registerLazySingleton<AuthenticationService>(
          () => FirebaseAuthentication());
}