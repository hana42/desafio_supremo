import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../bloc/login/login_cubit.dart';

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
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              EmailInput(),
              const SizedBox(height: 8),
              PasswordInput(),
              const SizedBox(height: 8),
              LoginButton(),
              const SizedBox(height: 8),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
