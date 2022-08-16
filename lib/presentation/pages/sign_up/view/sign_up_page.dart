import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/shared/widgets/header_widget.dart';

import '../cubit/sign_up_cubit.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: size.height * 0.3,
        child: HeaderWidget(size.height * 0.3),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Bem-vindo! Faça o cadastro para começar',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          BlocProvider<SignUpCubit>(
            create: (_) =>
                SignUpCubit(context.read<AuthenticationRepository>()),
            child: const SignUpForm(),
          ),
        ]),
      )
    ])));
  }
}
