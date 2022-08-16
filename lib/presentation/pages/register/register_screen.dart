import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/register/register_cubit.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/clipper_header.dart';
import '../../shared/widgets/header.dart';

import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterScreen());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kLightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  child: ClipperHeader(size.height * 0.3),
                ),
                SizedBox(height: size.height * 0.2),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Header(
                    title: 'Falta pouco!',
                    text: 'Cadastre-se e comece a utilizar agora mesmo, '
                        'sem esperar o cartão físico chegar.',
                  ),
                ),
              ],
            ),
            BlocProvider(
              create: (context) => RegisterCubit(AuthenticationRepository()),
              child: RegisterForm(),
            )
          ],
        ),
      ),
    );
  }
}
