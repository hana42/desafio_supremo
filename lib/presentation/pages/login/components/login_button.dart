import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:desafio_supremo/presentation/pages/onboarding/components/register_button.dart';

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
                child: CustomButton(
                  'Entrar',
                  key: const Key('loginForm_passwordInput_textField'),
                  onPressed: () {
                    return state.status.isValidated
                        ? () =>
                            context.read<LoginCubit>().logInWithCredentials()
                        : null;
                  },
                ),
              );
      },
    );
  }
}
