import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../bloc/login/login_cubit.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: locator.get<LoginCubit>(),
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => locator.get<LoginCubit>().emailChanged(email),
          decoration: InputDecoration(
            hintText: 'Email',
            errorText: state.email.invalid ? 'Email inválido' : null,
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
