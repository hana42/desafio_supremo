import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../usecases/authentication/sign_in.dart';
import 'package:desafio_supremo/domain/exceptions/exception.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late SignInUseCase signIn;

  LoginBloc({required SignInUseCase signInUseCase}) : super(LoginSuccess()) {
     this.signIn = signInUseCase;
  }

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is DoLogin) {
      yield* _mapDoLoginToState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapDoLoginToState(String email, String password,) async* {
    try {
      final response = await signIn(email, password);
      print(response);
      yield LoginSuccess();
    } catch (e) {
      yield  LoginFailure ( e.toString());
    }
  }
}