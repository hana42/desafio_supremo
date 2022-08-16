import 'package:desafio_supremo/presentation/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_cubit.dart';
import '../../shared/theme/constants.dart';

import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              child: HeaderWidget(250, true),
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
    // return Material(
    //   child: SingleChildScrollView(
    //     keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    //     padding: kDefaultPadding,
    //     child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(top: 40),
    //             alignment: Alignment.topLeft,
    //             child: Image.asset(
    //               'assets/images/NoBank3.png',
    //               width: 50,
    //               height: 50,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 55,
    //           ),
    //           Text(
    //             'Bem-vindo! Faça login para continuar',
    //             style: TextStyle(color: Colors.black, fontSize: 20),
    //           ),
    //           BlocProvider(
    //             create: (_) =>
    //                 LoginCubit(context.read<AuthenticationRepository>()),
    //             child: const LoginForm(),
    //           ),
    //           Align(
    //             alignment: Alignment.center,
    //             child: TextButton(
    //               onPressed: () {},
    //               child: Text(
    //                 'Esqueceu sua senha?',
    //                 style: Theme.of(context).textTheme.bodyText2,
    //               ),
    //             ),
    //           ),
    //         ]),
    //   ),
    // );
  }
}
