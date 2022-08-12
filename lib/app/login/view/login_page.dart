import 'package:authentication_repository/authentication_repository.dart';
import 'package:desafio_supremo/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';
import '../../../core/theme/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        reverse: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(4),
        child: Form(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/error_image.png',
                    scale: 1,
                  ),
                ),
                BlocProvider(
                  create: (_) =>
                      LoginCubit(context.read<AuthenticationRepository>()),
                  child: const LoginForm(),
                ),
              ]),
        ),
      ),
    );
  }
}
