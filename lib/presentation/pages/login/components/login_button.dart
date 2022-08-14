import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:desafio_supremo/injection.dart';

import '../../../bloc/login/login_cubit.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('loginForm_passwordInput_textField'),
                  onPressed: 
                  // state.status.isValidated
                      // ? 
                      () => locator.get<LoginCubit>().logInWithCredentials(),
                      // : null,
                  child: Text('Entrar'),
                ),
              );
      },
    );
  }
}
