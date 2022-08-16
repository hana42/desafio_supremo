import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/injection.dart';

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
          decoration: InputDecoration(
            errorText: state.password.invalid ? 'Senha inválida' : null,
            hintText: 'Senha',
            hintStyle: const TextStyle(color: Colors.black),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue)),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            fillColor: Colors.black,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
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
