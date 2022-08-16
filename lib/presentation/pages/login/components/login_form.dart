import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:desafio_supremo/presentation/shared/theme/constants.dart';

import '../../../bloc/login/login_cubit.dart';
import '../../home/home_screen.dart';

import 'email_input_field.dart';
import 'login_button.dart';
import 'password_input_field.dart';
import 'sign_up_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Falha na autenticação'),
              ),
            );
        }
      },
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            EmailInput(),
            SizedBox(
              height: 20,
            ),
            PasswordInput(),
            LoginButton(),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}
