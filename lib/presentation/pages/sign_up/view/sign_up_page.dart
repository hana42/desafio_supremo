import 'package:flutter/material.dart';
import 'package:desafio_supremo/presentation/shared/widgets/header_widget.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/theme/constants.dart';
import '../cubit/sign_up_cubit.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 250,
            child: HeaderWidget(250, true),
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
              //       Text(
              //         'Sign In',
              //         style: TextStyle(color: Colors.black, fontSize: 20),
              //       ),
              //       Text(
              //         'Welcome! Please sign in to continue',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Don\'t have an account?',
              //             style: TextStyle(color: Colors.black),
              //           ),
              //           TextButton(
              //               onPressed: () {},
              //               // onPressed: widget.onClickedSignUp,
              //               child: Text('Register')),
              //         ],
              //       ),
              //       TextFormField(
              //         // controller: emailController,
              //         textInputAction: TextInputAction.next,
              //         autovalidateMode:
              //             AutovalidateMode.onUserInteraction,
              //         // validator: (email) =>
              //         //     email != null && !Utils.validateEmail(email)
              //         //         ? 'Enter a valid email'
              //         //         : null,
              //         decoration: InputDecoration(
              //           hintText: 'Email',
              //           hintStyle: const TextStyle(color: Colors.black),
              //           enabledBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.grey, width: 1),
              //           ),
              //           focusedBorder: UnderlineInputBorder(
              //               borderSide:
              //                   const BorderSide(color: Colors.blue)),
              //           errorBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.red, width: 1),
              //           ),
              //           focusedErrorBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.red, width: 1),
              //           ),
              //           fillColor: Colors.black,
              //           isDense: true,
              //           contentPadding:
              //               const EdgeInsets.fromLTRB(12, 16, 12, 16),
              //         ),
              //         cursorColor: Colors.black,
              //         style: TextStyle(
              //             color: Colors.black,
              //             decorationColor: Colors.black,
              //             fontSize: 14),
              //       ),
              //       TextFormField(
              //         // controller: passwordController,
              //         textInputAction: TextInputAction.done,
              //         obscureText: true,
              //         autovalidateMode:
              //             AutovalidateMode.onUserInteraction,
              //         validator: (pass) => pass != null && pass.length < 6
              //             ? 'Password must contain at least 6 characters'
              //             : null,
              //         decoration: InputDecoration(
              //           hintText: 'Password',
              //           hintStyle: const TextStyle(color: Colors.black),
              //           enabledBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.grey, width: 1),
              //           ),
              //           focusedBorder: UnderlineInputBorder(
              //               borderSide:
              //                   const BorderSide(color: Colors.blue)),
              //           errorBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.red, width: 1),
              //           ),
              //           focusedErrorBorder: UnderlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.red, width: 1),
              //           ),
              //           fillColor: Colors.black,
              //           isDense: true,
              //           contentPadding:
              //               const EdgeInsets.fromLTRB(12, 16, 12, 16),
              //         ),
              //         cursorColor: Colors.black,
              //         style: TextStyle(
              //             color: Colors.black,
              //             decorationColor: Colors.black,
              //             fontSize: 14),
              //       ),
              //       // Align(
              //       //   alignment: Alignment.centerRight,
              //       //   child: TextButton(
              //       //       onPressed: () => Navigator.of(context).push(
              //       //             MaterialPageRoute(
              //       //               builder: (context) => PasswordRecoveryPage(),
              //       //             ),
              //       //           ),
              //       //       child: Text('Forgot Password?')),
              //       // ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //     ])),
            ]),
          )
        ])));
  }
}
