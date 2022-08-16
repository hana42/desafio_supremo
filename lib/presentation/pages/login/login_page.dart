import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/shared/widgets/header_widget.dart';

import '../../bloc/login/login_cubit.dart';

import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.3,
              child: HeaderWidget(size.height * 0.3),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Bem-vindo! Faça login para continuar',
                    style: TextStyle(color: Colors.black, fontSize: 22),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
