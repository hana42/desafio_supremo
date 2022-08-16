import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/di/injection.dart';

import '../../../bloc/login/login_cubit.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              locator.get<LoginCubit>().passwordChanged(password),
          obscureText: true,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            errorText: state.password.invalid ? 'Senha inválida' : null,
            hintText: 'Senha',
          ),
          cursorColor: Colors.black,
        );
      },
    );
  }
}
