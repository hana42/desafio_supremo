import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/shared/theme/constants.dart';
import 'package:desafio_supremo/presentation/shared/widgets/header.dart';

import '../../bloc/login/login_cubit.dart';
import '../../shared/widgets/clipper_header.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());
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
              child: ClipperHeader(size.height * 0.3),
            ),
            Header(title: 'Bem-vindo!', text: ''),
            Padding(
              padding: kDefaultPadding,
              child: BlocProvider(
                create: (_) => LoginCubit(
                  context.read<AuthenticationRepository>(),
                ),
                child: const LoginForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
