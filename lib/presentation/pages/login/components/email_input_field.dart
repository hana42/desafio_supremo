import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/injection.dart';

import '../../../bloc/login/login_cubit.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => locator.get<LoginCubit>().emailChanged(email),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: const TextStyle(color: Colors.black),
            errorText: state.email.invalid ? 'Email inválido' : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)),
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
