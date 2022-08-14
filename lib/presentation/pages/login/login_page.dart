import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/theme/constants.dart';

import '../../bloc/login/login_cubit.dart';

import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: kDefaultPadding,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/NoBank3.png',
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Text(
                'Bem-vindo! Faça login para continuar',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              BlocProvider(
                create: (_) =>
                    LoginCubit(context.read<AuthenticationRepository>()),
                child: const LoginForm(),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Esqueceu sua senha?',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
