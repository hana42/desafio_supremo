import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';

import '../../../bloc/login/login_cubit.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: locator.get<LoginCubit>(),
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              locator.get<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            errorText: state.password.invalid ? 'Senha inválida' : null,
            hintText: 'Senha',
          ),
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
            decorationColor: Colors.black,
            fontSize: 14,
          ),
        );
      },
    );
  }
}
